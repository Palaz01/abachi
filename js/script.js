$(document).ready(function(){
  //masonry
  var $container = $(".masonry");
  $container.imagesLoaded(function(){
    $container.masonry({
    itemSelector: '.item',
    isAnimated: true,
    isFitWidth: true  
    });
  });  
  
  
  //header menu
  $("#main_menu .firstLevelMenu a:eq(0)").click(function(){
    $(this).next(".submenu").toggle();
    
    
    return false;
  });
  
     
  //CAROUSEL 
  $(".jquery_gallery").jcarousel();
  
  
  //FANCYBOX
  $(".jquery_gallery a, .product_view_page a.first, a.fancybox, .masonry a").fancybox({
    'titleShow' : true,
    'transitionIn' : 'elastic',
    'transitionOut' : 'elastic',
    'easingIn' : 'easeOutBack',
    'easingOut' : 'easeInBack',
    'titlePosition' : 'over' 
  }); 
  $("a.iframe").fancybox({
    'width'				: '75%',
		'height'			: 330,
    'autoScale'     	: false,
    'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'type'				: 'iframe',
    'scrolling'   : 'no'
  });   
  
    
    
  $(".category_box a").click(function(){
    if ($(this).is(":last-child")) {return true;}

    else {
      $(this).next("ul").slideToggle();
      
      return false;      
    }
  });


  //INPUT FOCUS 
  $(".inputFocus span").css('display' , 'block');
  function checknextInput(t, event) {
    nextParent = t.parents("div:eq(0)").next("div");
    nextInput = nextParent.find("input");
    nextSpan = nextParent.find("span");
  
    if (  nextInput.attr("type") == "password" && 
          nextInput.val() == "" && 
          //t.find("input").val() == "" && 
          event == "focus") { 
            nextSpan.hide(); 
          }
    if (  nextInput.attr("type") == "password" && 
          nextInput.val() == "" && 
          event == "blur") { 
            nextSpan.show();
          }
  }
  function thisspanHide(t) { t.next("span").hide(); }
  
  
  $(".inputFocus").click(function(){
    $(this).find("span").hide().prev("input").focus();
    $(this).find("textarea").focus();
    checknextInput($(this), "focus");    
    
    return false;    
  });
  $(".inputFocus input").focus(function(){ thisspanHide($(this)); });  
  $(".inputFocus input, .inputFocus textarea").blur(function(){
    checknextInput($(this), "blur");
    
    if ($(this).val() == "") {
      $(this).next("span").show();
    }
  });
  $(window).load(function(){
    $(".inputFocus input, .inputFocus textarea").each(function(){ 
      if ($(this).val() != "" ) { thisspanHide($(this)); }
    });  
    
  });  
  
  
  
  //img slider box
  //config variables
  var autoscroll_on = true;
  var autoscroll_speed = 5000; //speed in millisec
  
  
  //script variables
  kepek_szama = $(".headerImgPager img").length-1; 
  aktualis_szam = 0;
  

  /******AUTO SCROLL START******/
  if (autoscroll_on && kepek_szama > 0) {
    var timer;

    
    //autoscroll function
    function autoscroll () {
      timer = setInterval(next, autoscroll_speed);
      
      return timer;
    }
    
    
    //scrolls items right
    function next () {
      next_szam = aktualis_szam+1;
      $(".headerImgPager .sliderControl").find(".active").removeClass("active");
            
      //when last item displayed autoscroll starts over 
      if (aktualis_szam == kepek_szama) {
        $(".headerImgPager img").hide();
        $(".headerImgPager img:eq(0)").fadeIn(3000);
        $(".headerImgPager .sliderControl a:eq(0)").addClass("active");
        
        aktualis_szam = 0;
      }
      
      else {
        $(".headerImgPager img").hide();
        $(".headerImgPager img:eq(" + next_szam + ")").fadeIn(3000);
        $(".headerImgPager .sliderControl a:eq(" + next_szam + ")").addClass("active");
        
        
        aktualis_szam = next_szam;
      }
    }
    
    $(".headerImgPager").hover(
      function() {clearInterval(timer);},
      function() {autoscroll ();}
    );    
    
    autoscroll ();
  }
  /******AUTO SCROLL END******/   
  
  
  //bind click function to page buttons
  $(".headerImgPager .sliderControl a").click(function(){
    i = $(this).prevAll().length;
    aktualis_szam = i;
    
    $(".headerImgPager .sliderControl").find(".active").removeClass("active");
    
    $(".headerImgPager img").hide();
    $(".headerImgPager img:eq(" + i + ")").fadeIn(3000);      

    //highlights active page link
    $(this).addClass("active");
    
    return false;
  });

  $('.toggle_content').hide();

  $('.toggle_item').click(function(){
    $(this).siblings().slideToggle();
    $(this).children('.fa').toggleClass('fa-chevron-down').toggleClass('fa-chevron-up');
    $(this).toggleClass('toggle_item_open');
  });

  // Custom checkbox

  $('.checkbox').on('click', function(){
    $('.custom_checkbox').toggleClass('checked');
  });
   
});

