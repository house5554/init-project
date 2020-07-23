---
to: pages/<%= h.inflection.camelize(name) %>/index.jsx
---
import React from "react";
<% if(etc.indexOf('graphql') >= 0){ %>
  import withApollo from "../../lib/apollo";
  import { useQuery } from "@apollo/react-hooks";
  import { gql } from "apollo-boost";
const GET_POSTS = gql`
  query {
    <%= h.inflection.camelize(name) %>FindAll(id: 1) {
      username
    }
  }
`;
function <%= h.inflection.camelize(name) %>() {
  const { loading, error, data, fetchMore } = useQuery(GET_POSTS, {
    variables: { skip: 0, first: 10 },
    notifyOnNetworkStatusChange: true
  });
  if (data && data.Test9FindAll) {
    return (
      <ul>
        <h1><%= h.inflection.camelize(name) %></h1>
        {data.Test9FindAll.map((post, index) => post.username)}
      </ul>
    );
  }
  return <div>Loading...</div>;
}
export default withApollo({ ssr: true })(<%= h.inflection.camelize(name) %>);
<% }else { %>

function <%= h.inflection.camelize(name) %>({ list }) {
  return (
    <ul>
      <h1><%= h.inflection.camelize(name) %></h1>
    </ul>
  );
}

// This function gets called at build time
export async function getStaticProps() {
  // Call an external API endpoint to get posts
  const res = await fetch("http://localhost:3000/api/<%= h.inflection.camelize(name) %>");
  const list = await res.json();

  // By returning { props: posts }, the Blog component
  // will receive `posts` as a prop at build time
  return {
    props: {
      list
    }
  };
}

export default <%= h.inflection.camelize(name) %>;
<% } %>
