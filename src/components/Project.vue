<template lang="pug">
  .project
    .card.small.float-top
      .tag {{project.tech}}
    .card
      h2 {{project.title}}
      | {{project.description}}
    .card.small.float-bottom(v-if="project.links.length > 0")
      a(v-for="link in project.links" :key="link.url" :href="link.url" target="_blank")
        img.feather-icon(v-if="link.type == 'github'" src="../assets/svg/github.svg")
        img.feather-icon(v-if="link.type == 'web'" src="../assets/svg/globe.svg")
</template>

<script lang="ts">
import Vue from 'vue';

export interface Project {
  title: string;
  description: string;
  tech: string;
  links: Array<ProjectLink>;
}

export interface ProjectLink {
  type: 'github' | 'web';
  url: string;
}

export default Vue.extend({
  name: 'project',
  props: {
    project: {
      type: Object,
      required: true,
    },
  },
});
</script>

<style lang="scss" scoped>
@import "../styles/colors";

.project {
  position: relative;
  max-width: 300px;
  min-width: 250px;
  margin: 0 32px 84px 32px;
  height: min-content;
}

.card {
  padding: 12px 18px;
  display: flex;
  align-items: center;
  flex-direction: column;
  text-align: center;

  &.small {
    padding: 7px 17px
  }

  &.float-top {
    position: absolute;
    z-index: 2;
    right: 24px;
    top: -24px;
  }

  &.float-bottom {
    position: absolute;
    z-index: 2;
    right: 24px;
    bottom: -24px;
    display: flex;
    flex-direction: row;
    align-content: center;

    @include themed() {
      background: t($card-alternative);
    }

    & > * {
      height: 24px;

      &:first-child {
        padding: 0 4px 0 0;
      }

      &:last-child {
        padding: 0 0 0 4px;
      }

      padding: 0 4px;
    }
  }
}

.tag {
  font-size: 18px;
  font-weight: 600;

  @include themed() {
    color: t($accent);
  }
}
</style>
