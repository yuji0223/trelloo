$(document).on("turbolinks:load", function() {
  $('.cardList').sortable({
    update: function(e, ui) {
      let item = ui.item;
      let item_data = item.data();
      let params = { _method: 'put' };
      params[item_data.modelName] = {
        row_order_position: item.index()
      };
      $.ajax({
        type: 'POST',
        url: item_data.updateUrl,
        dataType: 'json',
        data: params
      });
    },
    stop: function(e, ui) {
      ui.item
        .children('div')
        .effect('highlight', { color: '#FFC' }, 500);
    }
  });
});

// $(function() {
//   $('.cardList').sortable({
//     // リスト間移動できるがDB保存できない
//     connectWith: '.cardList',
//     update: function(e, ui) {
//       let item = ui.item;
//       let item_data = item.parents('.list').data();
//       let params = { _method: 'put' };
//       params[item_data.modelName] = {
//         row_order_position: item.index()
//       };
//       $.ajax({
//         type: 'POST',
//         url: item_data.updateUrl,
//         dataType: 'json',
//         data: params
//       });
//     },
//     stop: function(e, ui) {
//       ui.item
//         .children('div')
//         .effect('highlight', { color: '#FFC' }, 500);
//     }
//   });
// });
