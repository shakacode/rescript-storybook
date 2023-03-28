module.exports = {
  stories: ["../example/stories/**/*.@(js|jsx|ts|tsx)"],
  addons: [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    "@storybook/addon-actions",
    "@storybook/addon-interactions",
    "@storybook/addon-knobs",
  ],
  framework: "@storybook/react",
};
