import PhotoSwipeLightbox from './photoswipe/photoswipe-lightbox.esm.min.js';
import PhotoSwipe from './photoswipe/photoswipe.esm.min.js';
const lightbox = new PhotoSwipeLightbox({
  gallery: '#gallery',
  children: 'a',
  bgOpacity: 0.9,
  loop: true,
  wheelToZoom: true,
  spacing: 0.5,
  clickToCloseNonZoomable: false,
  preload: [2, 3],
  pswpModule: PhotoSwipe
});
lightbox.init();