﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using ManejoArchivos;

namespace Bibloteca
{

    public delegate void DelegadoLista(List<Persona> list);

    public class PersonaInicioXML
    {

        public List<Persona> listNueva;
        public event Action<string> eventoAviso;
        public event DelegadoLista EventAgregarLista;
        private Serializador<List<Persona>> ser;

        public PersonaInicioXML()
        {
            this.listNueva = new List<Persona>();
            ser = new Serializador<List<Persona>>(EtipoArchivoS.XML);
        }



        public Task inicioTask(string archivo)
        {
            Task tarea = Task.Run(() => traerXMLiniciales(archivo));
            return tarea;
        }
        


       /// <summary>
       /// Serializa el archivo pasado por parametro e invoca el evento
       /// </summary>
       /// <param name="archivo"></param>
        public void traerXMLiniciales(string archivo)
        {

            if (eventoAviso is not null)
            {
                eventoAviso.Invoke($"{DateTime.Now.ToString("dd / MM / yyyy HH: mm:ss")}: Iniciando serializacion de datos");
                //string arch = AppDomain.CurrentDomain.BaseDirectory + "CompradoresIniciales.xml";
                try
                {
                    this.listNueva = ser.Leer(archivo);
                    this.EventAgregarLista.Invoke(this.listNueva);
                    //BarColegio.Compradores.AddRange(this.listNueva);
                }
                catch(Exception ex)
                {
                    Thread.Sleep(6000);
                    eventoAviso.Invoke($"{DateTime.Now.ToString("dd / MM / yyyy HH: mm:ss")}: ERROR al serializar: {ex.Message}");
                }
                Thread.Sleep(6000);

                eventoAviso.Invoke($"{ DateTime.Now.ToString("dd / MM / yyyy HH: mm:ss")}: Serializacion finalizada con exito");
            }
           

        }

    }
}
