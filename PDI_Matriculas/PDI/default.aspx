<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PDI._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-xs-12 col-md-6 col-lg-3">
                    <div class="panel panel-blue panel-widget ">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked bag">
                                    <use href="#stroked-bag"></use></svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large">85</div>
                                <div class="text-muted">Hóspedes</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 col-lg-3">
                    <div class="panel panel-orange panel-widget">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked empty-message">
                                    <use href="#stroked-empty-message"></use></svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large">26</div>
                                <div class="text-muted">Novos Hóspedes</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 col-lg-3">
                    <div class="panel panel-teal panel-widget">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked male-user">
                                    <use href="#stroked-male-user"></use></svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large">21</div>
                                <div class="text-muted">Hóspedes a Sair</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 col-lg-3">
                    <div class="panel panel-red panel-widget">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked app-window-with-content">
                                    <use href="#stroked-app-window-with-content"></use></svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large">70%</div>
                                <div class="text-muted">Lotação de Parque</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Mês Acumulado</div>
                        <div class="panel-body">
                            <div class="canvas-wrapper">
                                <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-xs-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body easypiechart-panel">
                            <h4>Lotação Hotel</h4>
                            <div class="easypiechart" id="easypiechart-blue" data-percent="92">
                                <span class="percent">92%</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body easypiechart-panel">
                            <h4>Lotação Parque</h4>
                            <div class="easypiechart" id="easypiechart-orange" data-percent="65">
                                <span class="percent">65%</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body easypiechart-panel">
                            <h4>Crianças</h4>
                            <div class="easypiechart" id="easypiechart-red" data-percent="27">
                                <span class="percent">27%</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body easypiechart-panel">
                            <h4>Lotação Restaurante</h4>
                            <div class="easypiechart" id="easypiechart-teal" data-percent="56">
                                <span class="percent">56%</span>
                            </div>
                        </div>
                    </div>
                </div>               
            </div>               

        </div>

</asp:Content>
