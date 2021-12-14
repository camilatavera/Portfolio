﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Entidades;

namespace PetShop
{
    public partial class FrmCarrito : FrmBase
    {

        static Producto productoSeleccionado;
        
        public FrmCarrito()
        {
            InitializeComponent();
            btn_aceptar.DialogResult = DialogResult.OK;
            btn_cancelar.DialogResult = DialogResult.Cancel;

        }

         Producto ProductoSeleccionado
         {
            get { return productoSeleccionado; }
            set { productoSeleccionado = value; }
         }

        /// <summary>
        /// cargo el DataGridView y habilito los botones correspondientes
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FrmCarrito_Load(object sender, EventArgs e)
        {
            num_cantidad.Enabled = false;
            btn_aceptar.Enabled = false;
            Producto prodAux;
            for (int i = 0; i < FrmVender.CopyStock.Count; i++)
            {
                prodAux = FrmVender.CopyStock[i];
                this.cmb_producto.Items.Add(prodAux.Nombre);
            }
        }

        /// <summary>
        /// Al seleccion un producto en el combo box, cargo en el numeric up down 
        /// la cantidad que hay de stock
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cmb_producto_SelectionChangeCommitted(object sender, EventArgs e)
        {
            num_cantidad.Enabled = true;
            Producto prod;
            for(int i=0; i<FrmVender.CopyStock.Count; i++)
            {
                prod=FrmVender.CopyStock[i];
                if (prod.Nombre == cmb_producto.SelectedItem.ToString())
                {
                    ProductoSeleccionado = prod;
                    num_cantidad.Maximum = prod.Cantidad;

                }
            }
        }

        /// <summary>
        /// si el stock de producto es mayor a cero,habilito el boton aceptar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void num_cantidad_ValueChanged(object sender, EventArgs e)
        {
            if (num_cantidad.Value > 0)
            {
                btn_aceptar.Enabled = true;
            }
        }

        /// <summary>
        /// Si se cumplen las condiciones necesarias, agrego el product a la fila de
        /// pedidos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_aceptar_Click(object sender, EventArgs e)
        {
            Pedido pedidoNuevo;
            int cantidad;
            if (cmb_producto.SelectedItem != null && num_cantidad.Value != 0)
            {
                cantidad = (int)this.num_cantidad.Value;
                productoSeleccionado.Cantidad -= cantidad;
                FrmVender.Total += productoSeleccionado.Precio * cantidad;
                pedidoNuevo = new Pedido(productoSeleccionado, cantidad);
                FrmVender.PedidoActual.Push(pedidoNuevo);


            }
        }
    }
}
