<template>
  <q-card v-if="!hidden" flat bordered class="window">
      <q-card-section>
        <div class="row flex items-center no-wrap">
          <div class="col">
            <div class="text-h6">Support chat with {{user}}</div>
          </div>
          <div class="col-auto self-end">
            <q-btn color="grey-7" round flat icon="more_vert" @click="hidden = true"/>
          </div>
          <div class="col-auto self-end">
            <q-btn color="grey-7" round flat icon="delete" @click="deleteMessages"/>
          </div>
        </div>
      </q-card-section>


      <q-separator inset />

      <q-card-section class="messages">
        <q-chat-message v-for="message in messages"
                        :key="message.id"
                        :name="message.name"
                        :text=[message.message]
                        :stamp="message.date"
                        :sent="message.name === 'Admin'"
                        :bg-color="message.name !== 'Admin' ? 'primary' : 'green-3'"
                        :text-color="message.name !== 'Admin' ? 'white' : 'black'"
        />
      </q-card-section>

      <q-card-section>
        <q-input
          v-model="message"
          filled
          label="Type your message here"
          @keyup.enter="sendMessage"
        />
      </q-card-section>
    </q-card>

  <div class="chat-btn">
    <q-btn v-if="hidden" color="primary" @click="hidden = false" round fab icon="chat" />
  </div>
</template>

<script>
import { initializeApp } from "firebase/app";
import { getFirestore, collection, setDoc, getDoc, updateDoc, onSnapshot, doc, deleteDoc} from 'firebase/firestore';

const firebaseConfig = {
  apiKey: "AIzaSyDI3S-pmy8cjQgd9C25-BhC7nq7m-AIzMY",
  authDomain: "isphero.firebaseapp.com",
  databaseURL: "https://isphero-default-rtdb.europe-west1.firebasedatabase.app",
  projectId: "isphero",
  storageBucket: "isphero.appspot.com",
  messagingSenderId: "911722930693",
  appId: "1:911722930693:web:ec66e3f3d8f6df1f41726c",
  measurementId: "G-S2C6VQWGXP"
};

const app = initializeApp(firebaseConfig);
const db = getFirestore(app)
let messageCollection;

export default {
  name: "Chatwindow",
  props: {
    user: String,
    hidden: Boolean
  },
  data() {
    return {
      message: "",
      messages: [],
      userRef: "Admin",
      users: [],
    }
  },
  methods: {
    async sendMessage() {
      if (this.message === "") {
        return;
      }
      let date = new Date();
      date = date.toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit', second: '2-digit' });

      messageCollection = collection(db, 'messages');
      await getDoc(doc(db, "messages", 'chat--' + this.user)).then((docSnapshot) => {
        if (docSnapshot.exists()) {
          messageCollection = collection(db, 'messages', 'chat--' + this.user, 'messages');
        }
        messageCollection = collection(db, 'messages');
        setDoc(doc(db, "messages", 'chat--' + this.user), {
          username: this.user,
        });
        updateDoc(doc(db, "messages", 'chat--' + this.user), {
          lastMessage: this.message,
          lastMessageDate: date
        })
        let seconds = new Date().getTime() / 1000;
        messageCollection = collection(db, 'messages', 'chat--' + this.user, 'messages');
        setDoc(doc(db, "messages", 'chat--' + this.user, 'messages', this.user + '-' + seconds), {
          message: this.message,
          name: this.userRef,
          date: date
        });

        this.message = "";
      });
    },
    deleteMessages() {
      messageCollection = collection(db, 'messages', 'chat--' + this.user, 'messages');
      onSnapshot(messageCollection, (querySnapshot) => {
        querySnapshot.forEach((docum) => {
          deleteDoc(doc(db, "messages", 'chat--' + this.user, 'messages', docum.id));
        });
      });
      updateDoc(doc(db, "messages", 'chat--' + this.user), {
        lastMessage: '',
        lastMessageDate: ''
      })
      console.log("Messages deleted")
    }
  },
  mounted() {
    let audio = new Audio("/notification.mp3");
    messageCollection = collection(db, 'messages', 'chat--' + this.user, 'messages');
    onSnapshot(messageCollection, (querySnapshot) => {
      this.messages = [];
      querySnapshot.forEach((doc) => {
        this.messages.push(doc.data());
      });
      this.$nextTick(() => {
        if(this.hidden) return;
        let messages = document.querySelector(".messages");
        messages.scrollTop = messages.scrollHeight;
        if ((this.messages[this.messages.length - 1].name !== this.userRef
          || this.messages[this.messages.length - 1].name !== "Admin") && document.visibilityState === "hidden") {
          audio.play();
        }
      });
    });
  },
  watch: {
    user: function (val) {
      messageCollection = collection(db, 'messages', 'chat--' + this.user, 'messages');
      onSnapshot(messageCollection, (querySnapshot) => {
        this.messages = [];
        querySnapshot.forEach((doc) => {
          this.messages.push(doc.data());
        });
        this.$nextTick(() => {
          if(this.hidden) return;
          let messages = document.querySelector(".messages");
          messages.scrollTop = messages.scrollHeight;
        });
      });
    }
  }
}
</script>

<style scoped lang="scss">
.window {
  z-index: 1000;
  position: absolute;
  display: flex;
  flex-direction: column;
  align-items: center;
  background: #f5f5f5;
  border: 1px solid black;
  width: 300px;
  height: 450px;
  bottom: 25px;
  left: 10px;

  .window-title{
    background: #478aef;
    width: 100%;
    margin: 0;
    text-align: center;
    top: 0;
    position: relative;
    padding: 5px;
    border-bottom: 1px solid black;
  }

  .messages {
    height: auto;
    width: 100%;
    overflow-y: scroll;
  }
}

.chat-btn {
  position: fixed;
  bottom: 25px;
  left: 10px;
  z-index: 1000;
}
</style>
