<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="ZeytinYaglim.com.tr.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"></script>
    <style>
        .carousel-item {
            height: 500px;
            overflow: hidden;
        }

        .carousel-item img {
            object-fit: contain;
            height: 100%;
            width: 100%;
        }

        .carousel-indicators {
            display: none;
        }

        .thumbnail-img {
            height: 100px;
            width: 100px;
            object-fit: cover;
            cursor: pointer;
            opacity: 0.5;
            transition: opacity 0.3s ease-in-out;
        }

        .thumbnail-img.active {
            opacity: 1;
            filter: brightness(1.2);
        }
        .yapi{
            border:1px solid gray;
        }
        .tasiyici{
            width:80%;
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="rp_json" runat="server">
        <ItemTemplate>
            <div class="container mt-3">
                <div class="tasiyici">
                    <div class="row">
                        <div class="col-md-6 yapi">
                            <div id="carouselExample<%# Container.ItemIndex %>" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner mb-3">
                                    <div class="carousel-item active">
                                        <img src="Assets/UrunFoto/<%# Eval("foto1") %>" alt="Image 1">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="Assets/UrunFoto/<%# Eval("foto2") %>" alt="Image 2">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="Assets/UrunFoto/<%# Eval("foto3") %>" alt="Image 3">
                                    </div>
                                </div>
                                <ol class="carousel-indicators">
                                    <li data-bs-target="#carouselExample<%# Container.ItemIndex %>" data-bs-slide-to="0" class="active"></li>
                                    <li data-bs-target="#carouselExample<%# Container.ItemIndex %>" data-bs-slide-to="1"></li>
                                    <li data-bs-target="#carouselExample<%# Container.ItemIndex %>" data-bs-slide-to="2"></li>
                                </ol>
                                <div class="d-flex justify-content-center mb-3">
                                    <img src="Assets/UrunFoto/<%# Eval("foto1") %>" class="thumbnail-img active"
                                        data-bs-target="#carouselExample<%# Container.ItemIndex %>" data-bs-slide-to="0">
                                    <img src="Assets/UrunFoto/<%# Eval("foto2") %>" class="thumbnail-img"
                                        data-bs-target="#carouselExample<%# Container.ItemIndex %>" data-bs-slide-to="1">
                                    <img src="Assets/UrunFoto/<%# Eval("foto3") %>" class="thumbnail-img"
                                        data-bs-target="#carouselExample<%# Container.ItemIndex %>" data-bs-slide-to="2">
                                </div>
                                <a class="carousel-control-prev bg-dark" href="#carouselExample<%# Container.ItemIndex %>" role="button" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </a>
                                <a class="carousel-control-next bg-dark" href="#carouselExample<%# Container.ItemIndex %>" role="button" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true" style="color:black;"></span>
                                    <span class="visually-hidden" style="color:black;">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <script>
        $(document).ready(function () {
            var carousel = [];
            var thumbnailImgs = $('.thumbnail-img');

            $('.carousel').each(function (index) {
                carousel[index] = new bootstrap.Carousel(this);

                thumbnailImgs.on('click', function () {
                    var slideIndex = $(this).data('bs-slide-to');
                    carousel[index].to(slideIndex);

                    thumbnailImgs.removeClass('active');
                    thumbnailImgs.filter('[data-bs-target="#carouselExample' + index + '"][data-bs-slide-to="' + slideIndex + '"]').addClass('active');
                });

                $(this).on('slide.bs.carousel', function (event) {
                    var activeIndex = $(event.relatedTarget).index();
                    thumbnailImgs.removeClass('active');
                    thumbnailImgs.filter('[data-bs-target="#carouselExample' + index + '"][data-bs-slide-to="' + activeIndex + '"]').addClass('active');
                });
            });

            $('.carousel-control-prev').click(function (event) {
                event.preventDefault();
                var carouselIndex = $(this).attr('href').replace('#carouselExample', '');
                carousel[carouselIndex].prev();
            });

            $('.carousel-control-next').click(function (event) {
                event.preventDefault();
                var carouselIndex = $(this).attr('href').replace('#carouselExample', '');
                carousel[carouselIndex].next();
            });
        });
    </script>
</asp:Content>
