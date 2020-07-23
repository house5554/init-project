// ---
// to: config/passport.js
// ---
const passport = require("passport");
const GoogleStrategy = require("passport-google-oauth").OAuth2Strategy;
const KakaoStrategy = require("passport-kakao").Strategy;
const config = require("../../env.json")[process.env.NODE_ENV || "development"];
//jwt
var JwtStrategy = require("passport-jwt").Strategy,
  ExtractJwt = require("passport-jwt").ExtractJwt;
var opts = {};
opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = config.JWT_SECRET;
opts.issuer = "localhost:3000";
opts.audience = "localhost:3000";
//jwt
const jwt = require("jsonwebtoken");
const UsersService = require("../usecase/Users");
const User = new UsersService();
module.exports = server => {
  passport.serializeUser((user, done) => {
    // Strategy 성공 시 호출됨
    done(null, user); // 여기의 user가 deserializeUser의 첫 번째 매개변수로 이동
  });

  passport.deserializeUser((user, done) => {
    // 매개변수 user는 serializeUser의 done의 인자 user를 받은 것
    done(null, user); // 여기의 user가 req.user가 됨
  });
  passport.use(
    new GoogleStrategy(
      {
        clientID: config.AUTH.GOOGLE.GOOGLE_CLIENT_ID,
        clientSecret: config.AUTH.GOOGLE.GOOGLE_CLIENT_SECRET,
        callbackURL: config.AUTH.GOOGLE.CALLBACK_URL
      },
      async function(accessToken, refreshToken, profile, done) {
        console.log(profile);
        console.log("id", String(profile.id));
        try {
          const user = await User.findOne({
            "provider.name": "GOOGLE",
            "provider.id": profile.id,
            status: 1
          });
          //동일한 이메일을 가졌을 때는 이미 가입중인 사용자라면 바로 로그인하도록 아니라면 신규 사용자 생성
          if (user) {
            return done(null, user);
          } else {
            let newUser = await User.create({
              name: profile._json.name,
              provider: {
                name: "GOOGLE",
                id: String(profile.id),
                access_token: accessToken,
                refresh_token: refreshToken
              },
              token: accessToken,
              profile: profile._json.profile ? profile._json.profile : "",
              status: 1,
              deviceId: "",
              deviceModel: "",
              withdrawalDate: "",
              roles: ["USER"]
            });
            const token = await jwt.sign(
              {
                newUser
              },
              config.JWT_SECRET,
              {
                expiresIn: "14d"
              }
            );
            // newUser.token = token
            return done(null, {
              user: newUser,
              token: token
            });
          }
        } catch (error) {
          return done(error);
        }
      }
    )
  );

  passport.use(
    new KakaoStrategy(
      {
        clientID: config.AUTH.KAKAO.CLIENT_ID,
        clientSecret: "", // clientSecret을 사용하지 않는다면 넘기지 말거나 빈 스트링을 넘길 것
        callbackURL: config.AUTH.KAKAO.CALLBACK_URL
      },
      async function(accessToken, refreshToken, profile, done) {
        console.log(accessToken, refreshToken, profile);
        console.log("id", String(profile.id));
        // 사용자의 정보는 profile에 들어있다.
        try {
          const user = await User.findOne({
            "provider.name": "KAKAO",
            "provider.id": profile.id,
            status: 1
          });
          if (user) {
            return done(null, user);
          } else {
            const newUser = await User.create({
              name: profile.username,
              provider: {
                name: "KAKAO",
                id: String(profile.id),
                access_token: accessToken,
                refresh_token: refreshToken
              },
              token: accessToken,
              profile: "",
              status: 1,
              deviceId: "",
              deviceModel: "",
              withdrawalDate: "",
              roles: ["USER"]
            });
            return done(null, newUser);
          }
        } catch (error) {
          return done(error);
        }
        console.log("==============================");
      }
    )
  );
  passport.isAuthenticated = (req, res, next) => {
    console.log("req.isAuthenticated()", req.isAuthenticated(), req.user);
    try {
      var token = req.headers.authorization;
      const decoded = jwt.verify(token, config.JWT_SECRET);
      req.user = decoded;
      //req.login(req.user)
      return next();
    } catch (error) {
      return next(error);
    }
    /**
         * if (req.isAuthenticated()) {
            return next();
            }
            res.redirect('/login');
         */
  };
  passport.serializeUser(function(user, done) {
    console.log("serializeUser", user);
    done(null, user);
  });
  passport.deserializeUser(function(obj, done) {
    console.log("deserializeUser", obj);
    done(null, obj);
  });
  var session = require("express-session");

  // required for passport session
  server.use(
    session({
      secret: config.JWT_SECRET,
      saveUninitialized: true,
      resave: true
      // using store session on MongoDB using express-session + connect
      // store: new MongoStore({
      //     url: config.urlMongo,
      //     collection: 'sessions'
      // })
    })
  );
  server.use(passport.initialize());
  server.use(passport.session());

  return passport;
};
