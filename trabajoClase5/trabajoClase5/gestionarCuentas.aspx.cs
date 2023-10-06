using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trabajoClase5
{
    public partial class gestionarCuentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            actualizarLabel();
        }

        //Actualizar Tabla
        protected void actualizarLabel()
        {
            DataView dv = (DataView)SqlDataSourceCuentas.Select(DataSourceSelectArguments.Empty);
            StringBuilder tablaHtml = new StringBuilder();

            tablaHtml.Append("<table border='1'>");
            tablaHtml.Append("<tr>");
            tablaHtml.Append("<th>Cuentas</th>");
            tablaHtml.Append("</tr>");

            foreach (DataRowView rowView in dv)
            {
                DataRow row = rowView.Row;
                tablaHtml.Append("<tr>");
                tablaHtml.AppendFormat("<td>{0}</td>", row["descripcion"].ToString());
                tablaHtml.Append("</tr>");
            }

            tablaHtml.Append("</table>");

            tablaLB.Text = tablaHtml.ToString();
        }

        //Agregar
        protected void agregarBT_Click(object sender, EventArgs e)
        {            
                try
                {
                    this.SqlDataSourceCuentas.Insert();
                    this.resultadoLB.Text = "Se efectuó la carga.";
                    this.descripcionAgregarTB.Text = "";

                    actualizarLabel();
                }
                catch (SqlException)
                {
                    this.resultadoLB.Text = "Error de carga.";
                }
            
        }        
        //Eliminar
        protected void eliminarBT_Click(object sender, EventArgs e)
        {
            try
            {
                this.SqlDataSourceCuentas.Delete();
                this.resultadoLB.Text = "Se elimino la Cuenta.";

                actualizarLabel();
            }
            catch (SqlException)
            {
                this.resultadoLB.Text = "Error al eliminar.";
            }
        }
        //Modificar
        protected void modificarBT_Click(object sender, EventArgs e)
        {
            try
            {
                this.SqlDataSourceCuentas.Update();
                this.resultadoLB.Text = "Se modificó la Cuenta.";

                actualizarLabel();
            }
            catch (SqlException)
            {
                this.resultadoLB.Text = "Error al modificar.";
            }
        }

        //Seleccion Lista
        protected void seleccionLB_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSourceCuentasModificar.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSourceCuentasModificar.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            {
                descripcionModificarTB.Text = reader["descripcion"].ToString();
            }
        }
    }
}