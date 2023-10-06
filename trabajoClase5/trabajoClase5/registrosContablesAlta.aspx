<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrosContablesAlta.aspx.cs" Inherits="trabajoClase5.registrosContablesAlta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="210px">
            Agregar Registros<br />
            <asp:Label ID="Label1" runat="server" Text="Cliente:"></asp:Label>
            <br />
            <asp:DropDownList ID="cuentaDDL" runat="server" DataSourceID="SqlDataSourceCuenta" DataTextField="descripcion" DataValueField="idCuenta" Width="300px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Monto:"></asp:Label>
            <br />
            <asp:TextBox ID="montoTB" runat="server" Width="291px"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Tipo:"></asp:Label>
            <br />
            <asp:DropDownList ID="tipoDDL" runat="server" Width="297px">
                <asp:ListItem Value="0">Debe</asp:ListItem>
                <asp:ListItem Value="1">Haber</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="agregarBT" runat="server" OnClick="agregarBT_Click" Text="Agregar Registro" Width="300px" />
            <br />
            <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </asp:Panel>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            </p>
            <asp:SqlDataSource ID="SqlDataSourceCuenta" runat="server" ConnectionString="Data Source=ALEJANDRO;Initial Catalog=clase5;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Cuentas]">
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRegistros" runat="server" ConnectionString="Data Source=ALEJANDRO;Initial Catalog=clase5;Integrated Security=True" InsertCommand="INSERT INTO RegistrosContables(idCuenta, monto, tipo) VALUES (@idCuenta, @monto, @tipo)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [RegistrosContables]">
            <InsertParameters>
                <asp:Parameter Name="idCuenta" />
                <asp:Parameter Name="monto" />
                <asp:Parameter Name="tipo" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
