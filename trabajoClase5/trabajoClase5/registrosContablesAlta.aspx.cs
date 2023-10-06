using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trabajoClase5
{
    public partial class registrosContablesAlta : System.Web.UI.Page
    {
        //LOAD
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //BOTONES
        //Agregar
        protected void agregarBT_Click(object sender, EventArgs e)
        {
            int monto;
            bool montoNumero = Int32.TryParse(montoTB.Text, out monto);
            if (cuentaDDL.Text != "" && montoTB.Text != "" && tipoDDL.Text != "")
            {
                if (montoNumero == true)
                {
                    this.SqlDataSourceRegistros.InsertParameters["idCuenta"].DefaultValue = this.cuentaDDL.SelectedValue;
                    this.SqlDataSourceRegistros.InsertParameters["monto"].DefaultValue = this.montoTB.Text;
                    this.SqlDataSourceRegistros.InsertParameters["tipo"].DefaultValue = this.tipoDDL.SelectedValue;
                    this.SqlDataSourceRegistros.Insert();
                    this.resultadoLB.Text = "Se efectuó la carga.";

                    this.montoTB.Text = "";
                }
                else
                {
                    this.resultadoLB.Text = "El monto tiene que ser un número entero.";
                }
            }
            else { this.resultadoLB.Text = "Faltan cargar datos."; }
        }
    }
}