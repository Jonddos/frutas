const { createApp } = Vue;

const userApp = createApp({
  data() {
    return {
      store
    }
  }
})
userApp.mount('#userApp')