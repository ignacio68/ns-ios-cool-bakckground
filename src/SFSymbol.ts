import { Image, Property } from "@nativescript/core";

const symbolProperty: Property<SFSymbol, string> = new Property<SFSymbol, string>({
  name: "symbol"
});

// const scaleProperty: Property<SFSymbol, number> = new Property<SFSymbol, string>({
//   name: "scale"
// });

export class SFSymbol extends Image {
  createNativeView() {
    return UIImageView.new();
  }
  [symbolProperty.setNative](value: string) {
    (this.nativeView as UIImageView).image = UIImage.systemImageNamed(value);
  }
}

symbolProperty.register(SFSymbol);
