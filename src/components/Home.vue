<script lang="ts" setup>
  import { EventData, SegmentedBar } from "@nativescript/core";
  import { SwiftUI } from "@nativescript/swift-ui";
  import { ref } from "nativescript-vue";

  // const symbol = ref("multiply.circle.fill");
  // const isIOS = ref(global.isIOS);
  // const changeIcon = () => {
  //   symbol.value = symbol.value === "menucard" ? "multiply.circle.fill" : "menucard";
  // };

  let swiftUI: SwiftUI;

  interface coolBackgroundData {
    mode: "stars" | "circles";
  }

  const data = ref<coolBackgroundData>({ mode: "stars" });

  const onLoaded = (args: any) => {
    swiftUI = args.object;
    console.log("Swift UI component Loaded", swiftUI);
  };

  const onSelectIndexChanged = (args: EventData) => {
    const segmentedBar = args.object as SegmentedBar;
    if (segmentedBar.selectedIndex === 0) data.value.mode = "stars";
    else if (segmentedBar.selectedIndex === 1) data.value.mode = "circles";
    if (swiftUI) {
      swiftUI.updateData({ mode: data.value.mode });
    }
  };
</script>

<template>
  <Frame>
    <Page>
      <ActionBar>
        <Label text="Cool Background" class="font-bold text-lg" />
      </ActionBar>
      <!-- <StackLayout :visibility="isIOS ? 'visible' : 'collapsed'">
        <SymbolView class="h-[50] w-[50] mt-28" :symbol="symbol" />
        <Button text="Change icon" class="text-center mt-12 text-2xl" @tap="changeIcon" />
      </StackLayout> -->

      <GridLayout class="bg-black">
        <SwiftUI swiftId="coolBackground" class="w-full h-full" :data="data" @loaded="onLoaded"></SwiftUI>
        <StackLayout class="title-wrapper h-full w-5/6 bg-red-600"> </StackLayout>
        <StackLayout class="mt-2">
          <SegmentedBar class="bg-white h-8" @selectedIndexChanged="onSelectIndexChanged" selectedIndex="0">
            <SegmentedBarItem title="Stars" />
            <SegmentedBarItem title="Circles" />
          </SegmentedBar>
        </StackLayout>
      </GridLayout>
    </Page>
  </Frame>
</template>

<style>
  .title-wrapper {
    animation-name: highlight;
    animation-duration: 5s;
    animation-fill-mode: forwards;
  }

  @keyframes highlight {
    0% {
      transform: translate(0, 800);
    }

    100% {
      transform: translate(0, -800);
    }
  }
</style>
