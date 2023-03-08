<template>
<q-card>
  <q-card-section>
    <q-list>
      <div v-for="chat in chatList" :key="chat.id" >
        <q-item v-if="chat.lastMessage !== ''" clickable @click="goToChat(chat.username)" >
          <q-item-section avatar v-if="chat.lastMessage !== ''"  >
            <q-avatar>
              <img src="https://cdn.quasar.dev/img/avatar.png" alt="asd">
            </q-avatar>
          </q-item-section>
          <q-item-section v-if="chat.lastMessage !== ''" >
            <q-item-label>{{chat.username}}</q-item-label>
            <q-item-label caption>{{chat.lastMessage}}</q-item-label>
          </q-item-section>
          <q-item-section side v-if="chat.lastMessage !== ''" >
            <q-item-label caption>{{chat.lastMessageDate}}</q-item-label>
          </q-item-section>
        </q-item>
      </div>
    </q-list>
  </q-card-section>
</q-card>
</template>

<script>
import { initializeApp } from "firebase/app";
import { getFirestore, collection, addDoc, doc, getDocs, setDoc, collectionGroup } from 'firebase/firestore';
import axios from "axios";

var moment = require('moment');
const firebaseConfig = {
  apiKey: process.env.VITE_API_KEY,
  authDomain: process.env.VITE_AUTH_DOMAIN,
  databaseURL: process.env.VITE_DATABASE_URL,
  projectId: process.env.VITE_PROJECT_ID,
  storageBucket: process.env.VITE_STORAGE_BUCKET,
  messagingSenderId: process.env.VITE_SENDER_ID,
  appId: process.env.VITE_APP_ID,
  measurementId: process.env.VITE_MEASUREMENT_ID
};

const app = initializeApp(firebaseConfig);
const db = getFirestore(app)
export default {
  name: "ChatList",
  data() {
    return {
      chatList: [],
      users: [],
    }
  },
  methods: {
    getListOfChats() {
      const messageCollectionRef = collection(db, "messages");
      getDocs(messageCollectionRef).then((querySnapshot) => {
        querySnapshot.forEach((doc) => {
          const data = doc.data();
          const chat = {
            id: doc.id,
            username: data.username,
            lastMessage: data.lastMessage,
            lastMessageDate: data.lastMessageDate
          }
          this.chatList.push(chat);
          this.users.push(data.username)
        });
      });
      this.$emit("userList", this.users);
    },
    goToChat(username){
      this.$emit("chat", username);
    }
  },
  async mounted() {
    this.getListOfChats();
  }
}
</script>

<style scoped>

</style>
