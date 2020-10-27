<template lang="pug">
  .home
    ThemeSwitcher
    .content
      .title
        h1.name Xunafay
        span.projects.hidden-sm Projects.
      .wrapper
        .profile
          .pic
            img.card(src="../assets/profile.png")
          .socials
            a.social(href="https://github.com/xunafay" target="_blank")
              img.feather-icon(src="../assets/svg/github.svg")
              span xunafay
            a.social(href="mailto:me@xunafay.io")
              img.feather-icon(src="../assets/svg/mail.svg")
              span me@xunafay.io
            .social
              img.feather-icon(src="../assets/svg/map-pin.svg")
              span Belgium, Antwerp
        .project-list
          Project(v-for="project in projects" :key="project.title" :project="project")
</template>

<script lang="ts">
import Vue from 'vue';
import ThemeSwitcher from '../components/ThemeSwitcher.vue';
import Project, { Project as ProjectType } from '../components/Project.vue';

export default Vue.extend({
  name: 'home',
  components: {
    ThemeSwitcher,
    Project,
  },
  data: () => ({
    projects: [
      {
        title: 'Portfolio',
        description: 'Thats the page you are on right now!',
        tech: 'Vue',
        links: [
          { type: 'web', url: 'https://xunafay.io' },
          { type: 'github', url: 'https://github.com/xunafay/portfolio' },
        ],
      },
      {
        title: 'Stream Elements Discord Bot',
        description: 'A discord implementation of the Stream Elements Twitch chat bot',
        tech: 'Typescript',
        links: [{ type: 'github', url: 'https://github.com/xunafay/strimmer-elements' }],
      },
      {
        title: 'Twitch Clip Command',
        description: 'A tool to automatically create a twitch clip with a simple chat command',
        tech: 'Typescript',
        links: [{ type: 'github', url: 'https://github.com/xunafay/twitch-clip-command' }],
      },
      {
        title: 'Xuna Screeps',
        description: 'My from scratch implementation of a screeps AI',
        tech: 'Typescript',
        links: [{ type: 'github', url: 'https://github.com/xunafay/xuna-screeps' }],
      },
    ] as Array<ProjectType>,
  }),
});
</script>

<style lang="scss" scoped>
@import "../styles/colors";
@import "../styles/responsive";
.content {
  margin: 0 10%;
}

.pic {
  img.card {
    box-shadow: none;
    width: 224px;
    height: 224px;
  }
}

.title {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  margin-bottom: 24px;

  @include small() {
    justify-content: center;
  }
}

.wrapper {
  display: flex;
  flex-direction: row;

  @include small() {
    flex-direction: column;
  }
}

.pic {
  display: flex;
  @include small() {
    justify-content: center;
  }
}

.projects {
  @include themed() {
    color: t($accent);
  }

  @include medium() {
    justify-content: center;
  }

  font-weight: 600;
  font-size: 18px;
}

.project-list {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  justify-content: center;
  align-items: flex-start;
}

.card {
  width: 224px;
  height: 240px;

  &.profile-picture {
    position: relative;

    &:hover {
      img {
        top: -28px;
      }
    }

    img {
      transition: all 300ms ease-in-out;
      position: absolute;
      width: 200px;
      height: 200px;
      left: 12px;
      z-index: 2;
      border-radius: 28px;
      top: -20px;

      &.shadow {
        width: 150px;
        left: 37px;
        top: unset;
        bottom: 40px;
        height: 100px;
        filter: blur(20px);
        z-index: 1;
      }
    }
  }
}

.socials {
  margin-top: 20px;
  display: flex;

  @include small() {
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    margin-bottom: 52px;

    & > * {
      margin: 0 8px;

      &:first-child {
        margin-left: 0;
      }

      &:last-child {
        margin-right: 0;
      }
    }
  }

  @include medium() {
    flex-direction: column;
  }
}

.social {
  margin-top: 16px;
  margin-bottom: 16px;
  text-decoration: none;
  color: unset;
  display: flex;
  align-items: center;

  span {
    margin-left: 12px;
  }
}
</style>
