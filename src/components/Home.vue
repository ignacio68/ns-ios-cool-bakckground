<script lang="ts" setup>
  import { ref, computed, onMounted, onUnmounted, $navigateTo } from "nativescript-vue";
</script>

<template>
  <Frame>
    <Page>
      <ActionBar>
        <Label text="Home" class="font-bold text-lg" />
      </ActionBar>

      <GridLayout class="bg-black">
        <SwiftUI swiftId="coolBackground" class="w-full h-full"></SwiftUI>
        <!-- <Layout class="bg-transparent text-center text-3xl font-semibold from-neutral-300" text="Esto es una prueba" /> -->
      </GridLayout>
    </Page>
  </Frame>
</template>

<style>
  /* .info {
    font-size: 20;
  } */
</style>
