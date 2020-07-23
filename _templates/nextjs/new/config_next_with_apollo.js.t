---
to: "<%= etc.indexOf('graphql') >= 0 ? 'lib/apollo.js' : null %>"
unless_exists: true
---
import { withApollo } from 'next-apollo'
import ApolloClient, { InMemoryCache } from 'apollo-boost';
 
const apolloClient = new ApolloClient({
  uri: "http://localhost:3000/graphql",
  cache: new InMemoryCache()
});
 
export default withApollo(apolloClient)
