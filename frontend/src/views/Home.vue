<template>
  <div class="home">
    <img alt="Vue with Spring logo" src="../assets/spring-boot-vuejs-logo.png">
    <HelloSpringWorld hellomsg="Full-Stack Spring Boot & Vue.js Cloud Application by Mukut Kumar"/>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import HelloSpringWorld from '@/components/HelloSpringWorld.vue'; // @ is an alias to /src

export default defineComponent({
  name: 'Home',
  components: {
    HelloSpringWorld,
  },
});
</script>
