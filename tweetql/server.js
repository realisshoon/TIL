import { ApolloServer,gql } from "apollo-server";
 
//pakage.jason에 "type":"module" 추가 안했다면
// const{ApolloServer.gql}=require{"apollo-server"}

const typeDefs=gql`
     type Tweet{
        id:ID
        text:String
     }
    type Query {
        allTweets: [Tweet]
    }
`;

const server = new ApolloServer({typeDefs})

server.listen().then(({url})=>{
    console.log('Running on ${url}');
});

