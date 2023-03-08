<template>
  <q-layout view="lHh Lpr lFf">
    <q-header class="bg-amber-9" elevated>
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="toggleLeftDrawer"
        />

        <q-toolbar-title>
          ISP Hero - Admin Panel
        </q-toolbar-title>


        <q-btn
          flat
          dense
          round
          icon="notifications"
          aria-label="Notifications"/>
          <!--@click="toggleRightDrawer" -->

        <q-btn-dropdown
          color="white"
          outline
          icon="settings"
        >
          <div class="row no-wrap q-pa-md">
            <div class="column">
              <div class="text-h6 q-mb-md">Settings</div>
              <q-toggle v-model="darkMode" label="Darkmode" @update:model-value="toggleDarkMode" />
            </div>
          </div>
        </q-btn-dropdown>
        <q-btn
          flat
          dense
          round
          icon="logout"
          aria-label="Logout"
          @click="logout"
        >
          <q-tooltip
            anchor="top middle"
            self="bottom middle"
            >Logout
          </q-tooltip>
        </q-btn>
      </q-toolbar>
    </q-header>

    <q-drawer
      v-model="leftDrawerOpen"
      show-if-above
      bordered
    >
      <q-list>
        <q-item-label
          header
        >
          Management
        </q-item-label>

        <EssentialLink
          v-for="link in essentialLinks"
          :key="link.title"
          v-bind="link"
        />
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import {defineComponent, ref} from 'vue'
import EssentialLink from 'components/EssentialLink.vue'
import Chatwindow from "components/Chatwindow.vue";

const linksList = [
  {
    title: 'Dashboard',
    caption: 'Overview of environment',
    icon: 'dashboard',
    link: '#/home/dashboard'
  },
  {
    title: 'Users',
    caption: 'Manage users',
    icon: 'people',
    link: '#/home/users'
  },
  {
    title: 'Newsletter',
    caption: 'People who want to receive emails',
    icon: 'email',
    link: '#/home/newsletter'
  },
  {
    title: 'Services',
    caption: 'All services',
    icon: 'view_list',
    link: '#/home/services'
  },
  {
    title: 'Properties',
    caption: 'Overview & listing',
    icon: 'view_list',
    link: '#/home/properties'
  },
  {
    title: 'Settings',
    caption: 'Change settings',
    icon: 'settings',
    link: '#/home/settings'
  }
]

export default defineComponent({
  name: 'MainLayout',

  components: {
    Chatwindow,
    EssentialLink
  },
  data() {
    return {
      leftDrawerOpen: false,
      darkMode: false,
    }
  },
  methods: {
    toggleDarkMode() {
      this.$q.dark.toggle()
    },
    logout() {
      localStorage.removeItem('token')
      this.$router.push('/')
    },
    settings() {
      this.$router.push('/home/settings')
    },
    getActualTime() {
      // Get actual time in format HH:MM:SS and update it every second
      let date = new Date()
      let hours = date.getHours()
      let minutes = date.getMinutes()
      let seconds = date.getSeconds()
      if (hours < 10) hours = '0' + hours
      if (minutes < 10) minutes = '0' + minutes
      if (seconds < 10) seconds = '0' + seconds
      setInterval(this.getActualTime, 1000)
      this.time = hours + ':' + minutes + ':' + seconds
    }
  },
  async mounted() {
    let token = localStorage.getItem('token')
    let verifyToken = await fetch(process.env.LOGIN + '/auth/verify', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        token: token
      })
    })
    let response = await verifyToken.text()
    if (response.includes('false')) {
      localStorage.removeItem('token')
      this.$router.push('/')
    }
    //this.getActualTime()
  },

  setup () {
    const leftDrawerOpen = ref(false)

    return {
      essentialLinks: linksList,
      leftDrawerOpen,
      toggleLeftDrawer () {
        leftDrawerOpen.value = !leftDrawerOpen.value
      },
      darkMode: ref(document.body.classList.contains('q-dark'))
    }
  }
})
</script>
