<template lang="pug">
  .theme-switcher
    button.reset(type="button" @click="toggleTheme()")
      img.sun(v-if="theme === 'dark'" src="../assets/svg/sun.svg")
      img.moon(v-else src="../assets/svg/moon.svg")
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  name: 'theme-switcher',
  data: () => ({
    theme: 'light',
  }),
  created() {
    if (localStorage.getItem('theme') === 'dark') {
      document.documentElement.classList.add('theme--dark');
      this.theme = 'dark';
    } else {
      document.documentElement.classList.add('theme--light');
      this.theme = 'light';
    }
  },
  methods: {
    toggleTheme() {
      if (this.theme === 'light') {
        this.theme = 'dark';
        document.documentElement.classList.remove('theme--light');
        document.documentElement.classList.add('theme--dark');
        localStorage.setItem('theme', 'dark');
      } else {
        document.documentElement.classList.remove('theme--dark');
        document.documentElement.classList.add('theme--light');
        this.theme = 'light';
        localStorage.removeItem('theme');
      }
    },
  },
});
</script>

<style lang="scss" scoped>
.theme-switcher {
  margin: 8px 12px 0 0;
  display: flex;
  justify-content: flex-end;
}

img {
  transition: 150ms ease-in-out;

  // TODO does not rotate on hover of button padding
  &.moon {
    filter: invert(35%) sepia(68%) saturate(5224%) hue-rotate(203deg)
      brightness(102%) contrast(106%);
    transform: rotate(30deg);

    &:hover {
      transform: rotate(-15deg);
    }
  }

  &.sun {
    filter: invert(95%) sepia(65%) saturate(2636%) hue-rotate(326deg)
      brightness(103%) contrast(101%);

    &:hover {
      transform: rotate(-45deg);
    }
  }
}

a {
  outline: none;
}
</style>
