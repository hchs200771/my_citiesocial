import bulmaCarousel from 'bulma-carousel';

document.addEventListener('turbolinks:load', () => {   // 需要包在document都load完後執行
  let element = document.querySelector('#carousel')
  if (element){
    bulmaCarousel.attach('#carousel', {
      slidesToScroll: 1,
      slidesToShow: 4,
      autoplay: true,
      autoplaySpeed: 1500,    // 每1.5(s) 動一次
    });
  }
})

document.addEventListener('turbolinks:load', () => {
  (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
    const $notification = $delete.parentNode;

    $delete.addEventListener('click', () => {
      $notification.parentNode.removeChild($notification);
    });
  });
});
