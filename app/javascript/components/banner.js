import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Your home movies library"],
    typeSpeed: 70,
    loop: false
  });
}

export { loadDynamicBannerText };
