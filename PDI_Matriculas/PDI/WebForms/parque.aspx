<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="parque.aspx.cs" Inherits="PDI.WebForms.parque" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
				
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Gestão de Parque</h1>
			</div>
		</div>
						
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Advanced Table</div>
					<div class="panel-body">
                    <asp:Table ID="TabelaParque" runat="server">
                        <asp:TableHeaderRow runat="server">
                            <asp:TableHeaderCell Width="300px">Captura</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="300px">Lugar</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="300px">Matricula</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="300px">Resultado</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                    </asp:Table>						
					</div>
				</div>
			</div>
		</div>
		
		
	</div>

</asp:Content>
