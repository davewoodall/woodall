---
title: How to create a Vue Plugin Component
created_at: 2017-11-29
last_updated: 2017-11-29
kind: article
published: true
description: How to create a Vue Plugin Component
---

Vue components are the predominant approach to Vue Apps. However, there are situations which require universal access to state (data) or behavior (methods). Vue Plugins are how to address this situation.

This post is a step by step process of creating a Vue plugin.

<!-- more -->

**Step 1.** create a directory for the plugin

~~~
  mkdir SidebarPlugin
~~~

**Step 2.** create an `index.js` file to collect various pieces and parts

`cd SidebarPlugin; touch index.js`

## In index.js

**Step 3.** Create a component global component. Import it into `index.js`
_note - the component specifics are not the focus of this how-to. To see specifics, [visit the repo](https://github.com/cristijora/vue-paper-dashboard/tree/master/src/components/UIComponents/SidebarPlugin)_

`import Sidebar from './SideBar.vue';`

**Step 4.** This plugin is creating a global component called `<side-bar>`. In addition to inserting the component around the app, we need a way to manage it. For example, if `<side-bar>` is visible or not.

Create an object to manage sidebar specific data and some helper methods. For example, `showSidebar: Boolean` will be used from a global variable, which we will soon name `$sidebar` (in step 8)

```
const SidebarStore = {
  showSidebar: false,
  sidebarLinks: [
    {
      name: 'Dashboardly',
      icon: 'ti-panel',
      path: '/admin/overview'
    },
    {
      name: 'User Profile',
      icon: 'ti-user',
      path: '/admin/stats'
    }
  ],
  displaySidebar(value) {
    this.showSidebar = value;
  }
};
```

**Step 5.** Now create a plugin `const` and name it the same as directory for consisitency (`SidebarPlugin`)

```
const SidebarPlugin = {

  // Step 6. Wire up the plugin inside the install() function.
  // install() is a special method Vue calls when a Plugin is requested (in step 12).
  // (read more about Vue Plugins: [1])

  install(Vue) {

    // Step 7. For the SidebarStore to be reactive it must be wrapped in a mixin.
    // Creating a mixin will automatically attach the data to `$root`.
    // The following mixin will create `this.$root.sidebarStore`.

    Vue.mixin({
      data() {
        return {
          sidebarStore: SidebarStore
        };
      }
    });


    // Step 8. Use Object.defineProperty to attach the mixin (`this.$root.sidebarStore`)
    // onto Vue's prototype object. (Read more about Object.defineProperty at: [2])

    // Convention: Prefix with '$' to avoid name collisions.
    // Doing this step makes for a better experience (as you will see shortly)

    Object.defineProperty(Vue.prototype, '$sidebar', {
      get() {
        return this.$root.sidebarStore;
      }
    });


    // Step 9. Attach the component (from Step 3) to Vue's global component store

    Vue.component('side-bar', Sidebar);
  }
};
```

**Step 10.** export `const` (created in step 5)

`export default SidebarPlugin;`

## In main.js

**Step  11.** In `main.js`, import SidebarPlugin that was exported in step 10. Notice that the name is been changed to `SideBar` because the plugin's goal is to create a sidebar. The `import` method is smart enough to know you mean `SidebarPlugin/index.js` even though the file name, `index.js` is left off the `import` statement

`import SideBar from './components/UIComponents/SidebarPlugin';`

**Step 12.** Tell Vue to use the imported `SideBar` (from step 11).

`Vue.use(SideBar);`

## Using the component

**Step 13.** Now `<side-bar>` is available anywhere in the App. The API to manage `<side-bar>` is contained in `$sidebar`.

For example, check if sidebar should be displayed;

`this.$sidebar.displaySidebar(!this.$sidebar.showSidebar); // returns true or false`

In html, no need to use `this` when referencing `$sidebar`

`<button :class="{toggled: $sidebar.showSidebar}">`

The `<side-bar>` component can also reference `$sidebar` to populate it's content

`<side-bar type="navbar" :sidebar-links="$sidebar.sidebarLinks">`

## Footnotes

[1] [Writing a Plugin](https://vuejs.org/v2/guide/plugins.html)

[2] [Mozilla Object.defineProperty](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty)

Notes from reading [cristijora/vue-paper-dashboard SidebarPlugin](https://github.com/cristijora/vue-paper-dashboard/tree/master/src/components/UIComponents/SidebarPlugin)

> Usually components are suited for most cases. I would say 80-90% of the cases.
> For the rest 10-20%, you might find yourself using directives and plugins.
> Plugins usually incorporate some logic (data, component registration, maybe mixins or even directives)
> - cristijora
