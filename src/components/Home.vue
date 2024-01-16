<script lang="ts" setup>
  import { ref } from "nativescript-vue";
  const symbol = ref("multiply.circle.fill");
  const changeIcon = () => {
    symbol.value = symbol.value === "menucard" ? "multiply.circle.fill" : "menucard";
  };
</script>

<template>
  <Frame>
    <Page>
      <ActionBar>
        <Label text="Home" class="font-bold text-lg" />
      </ActionBar>
      <stackLayout>
        <symbolView class="h-[50] w-[50] mt-28" :symbol="symbol" />
        <button text="Change icon" class="text-center mt-12 text-2xl" @tap="changeIcon" />
      </stackLayout>
      <!-- <GridLayout class="bg-black">
        <SwiftUI swiftId="coolBackground" class="w-full h-full"></SwiftUI>
        <Layout class="bg-transparent text-center text-3xl font-semibold from-neutral-300" text="Esto es una prueba" />
      </GridLayout> -->
    </Page>
  </Frame>
</template>

<style>
  /* .info {
    font-size: 20;
  } */
</style>
