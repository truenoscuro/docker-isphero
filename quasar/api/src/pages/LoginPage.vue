<template>
  <q-layout class="hHh lpR fFf bg-grey-2">
    <q-page-container>
      <q-page class="flex flex-center">
        <q-card class="bg-blue-1 q-pa-md">
          <q-card-section>
            <div class="text-h5">Login</div>
          </q-card-section>
          <q-card-section>
            <q-form>
              <q-input
                v-model="username"
                label="Username"
                filled
                lazy-rules
                :rules="[val => val.length > 0 || 'Username is required']"
              />
              <q-input
                v-model="password"
                label="Password"
                filled
                lazy-rules
                :rules="[val => val.length > 0 || 'Password is required']"
                type="password"
              />
              <q-btn
                label="Login"
                color="primary"
                @click="login"
              />
            </q-form>
          </q-card-section>
        </q-card>
      </q-page>
    </q-page-container>
  </q-layout>
</template>

<script>
import { defineComponent } from 'vue'
import {QSpinnerFacebook} from "quasar"

export default defineComponent({
  name: 'App',
  components: {},
  data() {
    return {
      username: '',
      password: '',
      email: '',
    }
  },
  methods: {
    showLoading(){
      this.$q.loading.show({
        message: 'Logging in...',
        spinnerSize: 150,
        spinner: QSpinnerFacebook,
        backgroundColor: 'blue-7',
        spinnerColor: 'orange-7',
      })
    },
    login() {
      this.showLoading()
      fetch(process.env.LOGIN + '/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Referer-Policy': 'no-referrer-when-downgrade'
        },
        body: JSON.stringify({
          username: this.username,
          password: this.password
        })
      })
        .then(res => res.text())
        .then(res => {
          console.log(res)
          res = res.split(' ')
          if (res[0] === 'admin') {
            localStorage.setItem('token', res[1])
            this.$q.loading.hide()
            this.$q.notify({
              message: 'Login successful',
              color: 'positive',
              position: 'bottom',
              timeout: 3500
            })
            this.$router.push('/home')
          } else if (res[0] === 'user') {
            this.$q.loading.hide()
            this.$q.notify({
              message: res.join(' '),
              color: 'negative',
              position: 'bottom',
              timeout: 3500
            })
          } else {
            this.$q.loading.hide()
            this.$q.notify({
              message: res.join(' '),
              color: 'negative',
              position: 'bottom',
              timeout: 3500
            })
          }
        })
    }
  },
  mounted() {
    if (localStorage.getItem('token') !== null) {
      this.$router.push('/home')
    }
    let recaptchaScript = document.createElement('script')
    recaptchaScript.setAttribute('src', 'https://accounts.google.com/gsi/client')
    recaptchaScript.setAttribute('async', '')
    recaptchaScript.setAttribute('defer', '')
    document.head.appendChild(recaptchaScript)
    if (localStorage.getItem('token') === null) {
      recaptchaScript.onload = () => {
        google.accounts.id.initialize({
          client_id: process.env.CLIENT_ID + '.apps.googleusercontent.com',
          callback: async (responseGoogle) => {
            const tokenGoogle = responseGoogle.credential;
            this.$q.loading.show({
              message: 'Logging in...',
              spinnerSize: 150,
              spinner: QSpinnerFacebook,
              backgroundColor: 'blue-7',
              spinnerColor: 'orange-7',
            })
            const responseFetch = await fetch(process.env.LOGIN + '/auth/google', {
              method: 'POST',
              body: tokenGoogle,
            })
            const token = await responseFetch.text();
            if (token === 'Wrong credentials') {
              this.$q.notify({
                message: 'Wrong credentials',
                color: 'negative',
                position: 'bottom',
                timeout: 3500
              })
              this.$q.loading.hide()
              return
            }
            if (token === 'Unauthorized') {
              this.$q.notify({
                message: 'Unauthorized for this action',
                color: 'negative',
                position: 'bottom',
                timeout: 3500
              })
              this.$q.loading.hide()
              return
            }
            localStorage.setItem('token',`${token}`)
            this.$q.notify({
              message: 'Login successful',
              color: 'positive',
              position: 'bottom',
              timeout: 3500
            })
            this.$q.loading.hide()
            this.$router.push('/home')
          }
        });
        google.accounts.id.prompt();
      }
    }
  }
})
</script>
