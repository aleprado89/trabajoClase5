<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cuentasAlta.aspx.cs" Inherits="trabajoClase5.cuentasAlta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 171px;
        }
    </style>
</head>
<body style="height: 172px">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="149px">
            Agregar Cuenta<br />
            <asp:TextBox ID="descripcionAgregarTB" runat="server" Height="60px" MaxLength="50" Width="291px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Button ID="agregarBT" runat="server" OnClick="agregarBT_Click" Text="Agregar Cuenta" Width="300px" />
            <br />
            <br />
            <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceCuentas" runat="server" ConnectionString="Data Source=ALEJANDRO;Initial Catalog=clase5;Integrated Security=True" DeleteCommand="DELETE FROM Cuentas WHERE (idCuenta = @idCuenta)" InsertCommand="INSERT INTO Cuentas (descripcion) VALUES (@descripcion)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE Cuentas SET descripcion = @descripcion WHERE (idCuenta = @idCuenta)">
                <DeleteParameters>
                    <asp:Parameter Name="idCuenta" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" />
                    <asp:Parameter Name="idCuenta" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </form>
</body>
</html>
