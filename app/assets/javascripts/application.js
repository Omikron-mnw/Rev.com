// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.raty.js
//= require rails-ujs
//= require activestorage
//= require jquery.bxslider.js
//= require_tree .

// (document).ready(function(){
//   ('.bxslider').bxSlider({
//     auto: true,           //自動スライド
//     speed: 1000,          //スライドスピード
//     moveSlides: 1,        //移動するスライド数
//     pause: 3000,          //自動スライドの待ち時間
//     maxSlides: 8,         //一度に表示させる最大数
//     slideWidth: 250,      //各スライドの幅
//     randomStart: true,    //最初に表示させるスライドをランダムに設定
//     autoHover: true       //ホバー時に自動スライド停止

//   });
// });

/* global $document */
$(function() {
   /* global $ */
  $('#slider2').slick({
      autoplay: true,
      autoplaySpeed: 4000,
      slidesToShow: 3, //表示するスライドの数
      slidesToScroll: 3, //スクロールで切り替わるスライドの数

      //レスポンシブ対応させたい場合は以下も記述
      responsive: [{
        breakpoint: 768, //画面幅768pxで以下のセッティング
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2,
        }
      }]
  });
});