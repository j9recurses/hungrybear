window.onload = function () {

//check for empty objects
function isEmpty(obj) {
    for(var prop in obj) {
        if(obj.hasOwnProperty(prop))
            return false;
    }
    return true;
};

///ajax function because the syntax is long
function myajax_call(dataobj, success_fxn){
      $.ajax({
      type: dataobj.resttype,
      accepts: "application/json",
      url: dataobj.url,
      data: dataobj.data,
      success: success_fxn(dataobj.data),
      error: function() {
            console.log('Error occured');
      }
    });
  };

  //change the background pick size for mobile capat.
  function getpicsize( imgsize){
    var viewport = getWindowSize();
     if( viewport == 'xs' ) {
      return "100px"
    }
    else{
      return imgsize;
    }
  };

//function to set the background img size
 function setbackground_size(elem_ids, itemtype, imgsize, bkgrdsize){
    for(i=0; i< elem_ids.length; i++){
      var elem = "#"+itemtype+"_item"+ elem_ids[i].toString();
      console.log(elem)
      var background_url =  $(elem).attr("background-url");
      var imgsize = getpicsize(imgsize);
      var bkimg_style = { "background-image": "url(/imgs/"+itemtype+"/"+background_url,
                          "min-height":imgsize, "width":"100%",
                          "background-repeat": "no-repeat",
                          "background-position": "center center",
                          "background-size": bkgrdsize,
                          "opacity": "0.75" };
      $(elem).css(bkimg_style)
    }
  };
  //get window size function for mobile to resize imgs
  //768px, 992px and 1200px
  function getWindowSize(){
    var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
    var h = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
    if(w < 768){
      return "xs";
    }
  };


  //js for cafe page
  var cafes = $("#cafe");
  var cafe_ids = $(cafes).attr('cafe-ids')
  if( !( isEmpty(cafe_ids))){
    console.log("in the cafe section")
    cafe_ids = cafe_ids.split(",");
    setbackground_size(cafe_ids,"cafe", "250px", "80% 80%");
  }

  //js for menu page
  var menus = $("#menu_items");
    var menu_ids = $(menus).attr('menu-ids')
     if( !( isEmpty(menu_ids))){
      menu_ids = menu_ids.split(",");
    setbackground_size(menu_ids,"menu", "150px", "100% 100%");


  $('#menu_modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // href that triggered the modal
    var menu_name = button.data('menu-name')
    var menu_img = button.data('menu-img')
    var menu_description = button.data('menu-description')
    var menu_price = "$ " + button.data('menu-price')
    var menu_item_id = button.data('menu-id')
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    var modal = $(this)
    modal.find('.modal-title').text("Add a " + menu_name + " to Your Lunch Bag")
    modal.find('#menu_item_id').attr( "data-menu-item-id", menu_item_id )
    modal.find('.modal_menu_name').text(menu_name)
    modal.find('.modal_menu_price').text( menu_price)
    modal.find('#modal_menu_img').css({ "background-image": "url(/imgs/menu/"+menu_img,
                          "min-height":"100px", "width":"100%",
                          "background-repeat": "no-repeat",
                          "background-position": "center center",
                          "background-size": "100%",
                          "opacity": "0.75" })
    modal.find('#modal_menu_description').text(menu_description)
  });

  function getCurrentUserId(){
    ////this would be some kind of function to get sessions data
    ///or cookie data aboutthe current user.
  };

  function lunchbag_success_fxn(data) {
       console.log("posted data");
        //update the bag icon in the nav bar
        // to let the user know that they've added something
        $('.icon-block').css('color', "#FDB515");
        var userbagcnt = parseInt($("#userbagcnt").text());
        console.log( userbagcnt);
        if(!(isNaN(userbagcnt)) ){
           $("#userbagcnt").html(userbagcnt+ 1);
        }
        else{
          console.log("in here cool!!")
           $("#userbagcnt").html(1);
        }
        //set the input text on the special instructions back to null
        $('#message-text').val("");
      };

  function send_menu_lunchbag_to_server(menu_item_obj){
    var lunchitemdata =  {
      menu_id: $('#menu_modal').find('#menu_item_id').attr( "data-menu-item-id"),
      special_instructions: $('#message-text').val(),
      user_id:1
    };
    var lunchdata = {
      data:lunchitemdata,
      resttype:"POST",
      url: "/userlunchbag/new"
    };
    myajax_call(lunchdata, lunchbag_success_fxn);
  };


  //redirect the user to the checkout page or let them keep shopping
   $('#modalAddtoLunchbag').click(function() {
      send_menu_lunchbag_to_server();
      $('#menu_modal').modal('hide');
  });

  $('#modalAddtoLunchbagAndCheckout').click(function() {
    console.log("in heere!!")
    send_menu_lunchbag_to_server();
    $('#menu_modal').modal('hide');
    ///would redirect to the a page that has the user id
    ///not enough time to deal with sessions
     var link = "/userlunchbag/1"
     location.href = link;
  });

}




};
