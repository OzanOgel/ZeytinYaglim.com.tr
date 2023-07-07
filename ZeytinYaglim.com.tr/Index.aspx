<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ZeytinYaglim.com.tr.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        body{
            
        }
    .carousel-item {
      height: 400px;
    }

    .carousel-item img {
      object-fit: cover;
      height: 100%;
      width: 100%;
    }

    .carousel-indicators {
      display: none; 
    }
    .table {
        background-color: #f2f9e9;
    }

    .table th {
        background-color: #AFB23F;
    }

    .table td {
        background-color:rgba(202,159,3,0.2);
    }
    
   
    @media (max-width: 767px) {
      .carousel-item {
        height: 200px; 
      }
    }
    .buy{
        background-color:darkolivegreen !important;
       
    }
    .card:hover{
        border-color:darkolivegreen;
        box-shadow:0 0 10px 2px darkolivegreen;
    
    }
   
    </style>
    <script src="Assets/angular-1.8.2/angular.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
          <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="border:1px solid #B6D957">
    <ol class="carousel-indicators">
      <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
      <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
      <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="Assets/Images/slide 1.jpg" alt="Slide 1">
      
      </div>
      <div class="carousel-item">
        <img src="Assets/Images/slider2.jpg" alt="Slide 2">
       
      </div>
      <div class="carousel-item">
        <img src="Assets/Images/slide3.jpg" alt="Slide 3">
       
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </a>
  </div>


    </div>
    <div class="container mt-5" style="padding-left:50px; padding-right:50px;">
     <div ng-app="tablo" ng-controller="controller">
    <input type="text" ng-model="search" placeholder="Arama..." class="form-control" />
         <div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <div class="row">
                <div class="col-12 col-md-6 col-xl-4" ng-repeat="x in veri | filter:search">
                    <div class="card" style="margin-bottom:30px;">
                        <img ng-src="Assets/UrunFoto/{{x.Foto1}}" style="max-width:400px; max-height:500px;" class="card-img-top" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title" style="text-align:center;"><strong>{{x.UrunAdi}}</strong></h5>
                            <p class="card-text" style="min-height:70px; text-align:center;">{{x.aciklama}}</p>
                            <p class="card-text">Fiyat: {{x.UrunFiyat}}</p>
                            <p class="card-text">Şişe Türü: {{x.sise}}</p>
                            <p class="card-text">Litre: {{x.litre}}</p>
                            <a href="Details.aspx?zid={{x.UrunNo}}" class="buy btn btn-dark" ng-click="buyClicked($event)">Satın Al</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <div class="table-responsive">
        <table class="table table-bordered">
            <tr>
                <th>Ürün Numarası</th>
                <th>Fotoğraf</th>
                <th>Ürün Adı</th>
                <th>Şişe Türü</th>
                <th>Fiyat</th>
                <th>Açıklama</th>
                <th>Litre</th>
                <th>Satın Al</th>
            </tr>
            <tr ng-repeat="x in veri | filter:search">
                <td>{{x.UrunNo}}</td>
                <td><img src="Assets/UrunFoto/{{x.Foto1}}" style="width:80px; height:100px;" /></td>
                <td>{{x.UrunAdi}}</td>
                <td>{{x.sise}}</td>
                <td>{{x.UrunFiyat}}</td>
                <td>{{x.aciklama}}</td>
                <td>{{x.litre}}</td>
                <td><a href="Details.aspx?zid={{x.UrunNo}}" class="buy btn btn-dark" ng-click="buyClicked($event)">Satın Al</a></td>
            </tr>
            
        </table>

    </div>

</div>

    </div>

   
<script>
    var app = angular.module('tablo', []);
    app.controller('controller', function ($scope, $http, $interval) {
        $scope.buyClicked = function (event) {
            if (event.currentTarget.classList.contains('disabled')) {
                event.preventDefault();
                return;
            }

            event.currentTarget.classList.add('disabled');

            setTimeout(function () {
                event.currentTarget.classList.remove('disabled');
            }, 1000);
        };

        $interval(function () {
            $http.get('json.json').then(function (response) {
                $scope.veri = response.data;
            });
        }, 1000);
    });
</script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.kucuk-fotograf').click(function () {
                var buyukFotoUrl = $(this).data('buyuk-foto');
                $('#buyukFoto').attr('src', buyukFotoUrl);

                $('.kucuk-fotograf').removeClass('secili');
                $(this).addClass('secili');
            });
        });
    </script>

  
</asp:Content>
    