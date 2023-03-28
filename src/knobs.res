@val @module("@storybook/addon-knobs")
external withKnobs: Main.decorator = "withKnobs"

@val @module("@storybook/addon-knobs")
external extText: (string, Js.null_undefined<string>) => string = "text"

let text = (~label: string, ~defaultValue: option<string>=?, ()) =>
  extText(label, Js.Nullable.fromOption(defaultValue))

@val @module("@storybook/addon-knobs")
external extBoolean: (string, bool) => bool = "boolean"

let boolean = (~label: string, ~defaultValue=false, ()) => extBoolean(label, defaultValue)

type rangeConfig = {
  range: bool,
  min: float,
  max: float,
  step: float,
}

@val @module("@storybook/addon-knobs")
external extNumber: (string, float, Js.null_undefined<rangeConfig>) => float = "number"

let number = (
  ~label: string,
  ~defaultValue=0.,
  ~rangeConfiguration: option<rangeConfig>=?,
  (),
): float =>
  switch rangeConfiguration {
  | None => extNumber(label, defaultValue, Js.Nullable.undefined)
  | Some(config) => extNumber(label, defaultValue, Js.Nullable.return(config))
  }

@val @module("@storybook/addon-knobs")
external extColor: (string, Js.null_undefined<string>) => string = "color"

let color = (~label: string, ~defaultValue: option<string>=?, ()) =>
  extColor(label, Js.Nullable.fromOption(defaultValue))

type selectConfig<'a> = 'a

@val @module("@storybook/addon-knobs")
external extSelect: (string, selectConfig<'a>, Js.null_undefined<string>) => string = "select"

let select = (~label: string, ~options: selectConfig<'a>, ~defaultValue: option<string>=?, ()) =>
  extSelect(label, options, Js.Nullable.fromOption(defaultValue))

@module("@storybook/addon-knobs")
external selectFromArray: (~label: string, ~options: array<'a>, ~defaultValue: string, unit) => 'a =
  "select"

@module("@storybook/addon-knobs")
external selectFromDict: (
  ~label: string,
  ~options: Js.Dict.t<'a>,
  ~defaultValue: string,
  unit,
) => 'a = "select"

@module("@storybook/addon-knobs")
external selectFromAny: (~label: string, ~options: 'a, ~defaultValue: string, unit) => 'a = "select"

@val @module("@storybook/addon-knobs")
external extDate: (string, Js.null_undefined<Js_date.t>) => string = "date"

let date = (~label: string, ~defaultValue: option<Js_date.t>=?, ()) =>
  extDate(label, Js.Nullable.fromOption(defaultValue))

type button

@val @module("@storybook/addon-knobs")
external extButton: (string, ReactEvent.Mouse.t => unit) => button = "button"

let button = (~label: string, ~handler: ReactEvent.Mouse.t => unit, ()) => extButton(label, handler)

@module("@storybook/addon-knobs")
external object: (~label: string, ~defaultValue: 'a, unit) => 'a = "object"
