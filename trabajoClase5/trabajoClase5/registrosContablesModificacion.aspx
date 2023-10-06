<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrosContablesModificacion.aspx.cs" Inherits="trabajoClase5.registrosContablesModificacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
        <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="117px">
            Buscar Registro Contable<br /> Id Registro Contable:<br />&nbsp;<asp:TextBox ID="idRegistroTB" runat="server" Width="229px"></asp:TextBox>
            <br />
            <asp:Button ID="buscarBT" runat="server" OnClick="buscarBT_Click" Text="Buscar Registro" Width="127px" />
            <br />
            <asp:Label ID="idLB" runat="server" Text="-"></asp:Label>
            &nbsp;<asp:Label ID="Label2" runat="server" Text="-"></asp:Label>
            &nbsp;<asp:Label ID="datosLB" runat="server" Text="-"></asp:Label>
            <br />
        </asp:Panel>
        </div>
        <div>
        <asp:Panel ID="panelModificacion" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="210px" Enabled="False">
            Modificar Registros<br />
            <asp:Label ID="Label1" runat="server" Text="Cliente:"></asp:Label>
            <br />
            <asp:DropDownList ID="cuentaDDL" runat="server" DataSourceID="SqlDataSourceCuentas" DataTextField="descripcion" DataValueField="idCuenta" Width="300px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Monto:"></asp:Label>
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
            <asp:Button ID="actualizarBT" runat="server" OnClick="actualizarBT_Click" Text="Actualizar Cuenta" Width="300px" />
            <br />
            <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
        </asp:Panel>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            <asp:SqlDataSource ID="SqlDataSourceRegistros" runat="server" ConnectionString="Data Source=ALEJANDRO;Initial Catalog=clase5;Integrated Security=True" DeleteCommand="DELETE FROM RegistrosContables WHERE (idRegistrosContables = @idRegistrosContables)" InsertCommand="INSERT INTO Cuentas (descripcion) VALUES (@descripcion)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Cuentas.descripcion, RegistrosContables.idRegistrosContables, RegistrosContables.idCuenta, RegistrosContables.monto, RegistrosContables.tipo FROM Cuentas INNER JOIN RegistrosContables ON Cuentas.idCuenta = RegistrosContables.idCuenta WHERE (RegistrosContables.idRegistrosContables = @idRegistrosContables)" UpdateCommand="UPDATE RegistrosContables SET idCuenta = @idCuenta, monto = @monto, tipo = @tipo WHERE (idRegistrosContables = @idRegistrosContables)">
                <DeleteParameters>
                    <asp:Parameter Name="idRegistrosContables" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="idRegistrosContables" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idCuenta" />
                    <asp:Parameter Name="monto" />
                    <asp:Parameter Name="tipo" />
                    <asp:Parameter Name="idRegistrosContables" />
                </UpdateParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCuentas" runat="server" ConnectionString="<%$ ConnectionStrings:clase5ConnectionString %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
    </form>
</body>
</html>
