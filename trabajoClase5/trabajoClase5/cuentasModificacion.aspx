<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cuentasModificacion.aspx.cs" Inherits="trabajoClase5.cuentasModificacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:Panel ID="Panel4" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="112px">
            Buscar Cuenta<br /> Id Cuenta:<br />&nbsp;<asp:TextBox ID="idCuentaTB" runat="server" Width="229px"></asp:TextBox>
            <br />
            <asp:Button ID="buscarBT" runat="server" OnClick="buscarBT_Click" Text="Buscar Cuenta" Width="152px" />
            <br />
            <asp:Label ID="idLB" runat="server" Text="-"></asp:Label>
            &nbsp;<asp:Label ID="Label2" runat="server" Text="-"></asp:Label>
            &nbsp;<asp:Label ID="descripcionLB" runat="server" Text="-"></asp:Label>
        </asp:Panel>
        </div>
        <asp:Panel ID="panelModificacion" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="161px" Enabled="False">
            Modificar Cuenta<br />
            <asp:Label ID="Label3" runat="server" Text="Descripción"></asp:Label>
            :<br />
            <asp:TextBox ID="descripcionModificarTB" runat="server" Height="60px" MaxLength="50" Width="291px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Button ID="actualizarBT" runat="server" OnClick="actualizarBT_Click" Text="Actualizar Cuenta" Width="125px" />
            <br />
            <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
            <br />
            <br />
        </asp:Panel>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            <asp:SqlDataSource ID="SqlDataSourceCuenta" runat="server" ConnectionString="<%$ ConnectionStrings:clase5ConnectionString %>" DeleteCommand="DELETE FROM Cuentas WHERE (idCuenta = @idCuenta)" InsertCommand="INSERT INTO Cuentas (descripcion) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas] where idCuenta= @idCuenta" UpdateCommand="UPDATE Cuentas SET descripcion = @descripcion WHERE (idCuenta = @idCuenta)">
                <DeleteParameters>
                    <asp:Parameter Name="idCuenta" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="idCuenta" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" />
                    <asp:Parameter Name="idCuenta" />
                </UpdateParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
