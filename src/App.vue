<template>
  <div id="app">
    <router-view />
  </div>
</template>

<style lang="scss">
@import "~bulma/sass/utilities/_all.sass";
@import "~bulma/sass/grid/_all.sass";
@import "~bulma/sass/layout/_all.sass";
@import "~bulma/sass/elements/container.sass";

@import "./styles/button";
@import "./styles/colors";
@import "./styles/typing";
@import "./styles/components";

html,
body {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  margin: 0;
  padding: 0;
  font-family: "Poppins", sans-serif;
}

body {
  @include themed() {
    background: t($bg);
    color: t($fg);
  }
}

.feather-icon {
  @include themed() {
    filter: t(feather-icon);
  }

  width: 24px;
  height: 24px;
}

a {
  outline: none;
}
</style>
