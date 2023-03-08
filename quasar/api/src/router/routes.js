
const routes = [
  {
    path: '/',
    component: () => import('pages/LoginPage.vue')
  },
  {
    path: '/home',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/IndexPage.vue') },
      { path: 'users', component: () => import('pages/UserPage.vue') },
      { path: 'dashboard', component: () => import('pages/DashboardPage.vue') },
      { path: 'newsletter', component: () => import('pages/NewsletterPage.vue') },
      { path: 'edit-user/:id', component: () => import('pages/EditUserPage.vue') },
      { path: 'services', component: () => import('pages/Services.vue') },
      { path: 'services/:id', component: () => import('pages/ServicesUserPage.vue') },
      { path: 'properties', component: () => import('pages/PropertiesPage.vue') },
      { path: 'property/:id', component: () => import('pages/EditPropertyPage.vue') },

    ]
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/ErrorNotFound.vue')
  }
]

export default routes
