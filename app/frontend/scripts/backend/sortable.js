import Sortable from 'sortablejs';
import Rails from '@rails/ujs';

document.addEventListener("turbolinks:load", () => {
  let el = document.querySelector('.sortable-items')
  if(el) {
    Sortable.create(el, {
      onEnd: (event) => {
        let [_model, id] = event.item.dataset.item.split('_')

        let data = new FormData()
        data.append('id', id)
        data.append('from', event.oldIndex)
        data.append('to', event.newIndex)

        Rails.ajax({
          url: '/admin/categories/sort',
          type: 'put',
          data,
          success: (res)=>{
            console.log(res);
          },
          error: (err)=>{
            console.log(err);
          }
        })
      }
    })
  }
})
