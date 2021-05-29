<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Instituto Tecnólogico Edix</title>
                <link rel="stylesheet" type="text/css" href="estilos_ite.css"/>
                
            </head>
            <body>
                <header>
                    <a href="#" class="logo"><img src="edix-formacion.png" width="100px"/></a>
                    <ul>  
                      <li><a href="#">Sobre edix</a></li> 
                      <li><a href="#">Formación Profesional</a>
                        <ul class="dropdown" aria-label="submenu">
                          <li><a href="#">DAM</a></li>
                          <li><a href="#">DAW</a></li>
                          <li><a href="#">ASIR</a></li>
                        </ul>
                      </li>
                      <li><a href="#">Profesores</a></li> 
                      <li><a href="#">Direccion</a></li> 
                      <li><a href="#">Contacto</a></li> 
                    </ul>
                  </header>

                  <div>
                    <section class="banner">
                        <div class="contenido_banner">
                            <h1>Únete a la Revolución de la Formación Profesional</h1>
                            <p>¿Quieres una titulación oficial? Estudia uno de nuestros FP tecnológicos. 
                            ¿Te apasiona el marketing digital? Entonces nuestros cursos digitales 
                            llevan tu nombre. En Edix formamos a Digital Workers, los Expertos
                            Digitales que las empresas necesitan hoy. Da igual de donde vengas. 
                            Partes de cero y consigues un perfil con alta empleabilidad.
                            </p>
                            <a href="https://www.edix.com/es/carreras/">Cursos de especialización</a>
                            <br/>
                            <a href="https://www.edix.com/es/fp/">Grados superiores</a>
                        </div>
                    </section>
                  </div>

                <section class="content">
                      <div class="tabla_grados">
                        
                        <table class="tabla1" border="1">
                            <caption>Formación profesional</caption>
                        <tr>
                            <th></th>
                            <th>Ciclos formativos</th>
                            <th>Grado</th>
                            <th>Año</th>
                        </tr>
                        <xsl:for-each select="//ciclos/ciclo">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="nombre"/></td>
                                <td><xsl:value-of select="grado"/></td>
                                <td><xsl:value-of select="decretoTitulo/@año"/></td>
                            </tr>
                        </xsl:for-each> <!-- Fin de for each de ciclo-->
                        </table>
                    </div>
                </section>

                <section class="content2">        
                    <div class="tabla_info">    
                        <div class="float_izq">
                            <table class="tabla2" border="1">
                                <caption>Profesores</caption>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                </tr>
                                <xsl:for-each select="//profesores/profesor">
                                    <tr>
                                        <td><xsl:value-of select="id"/></td>
                                        <td><xsl:value-of select="nombre"/></td>
                                    </tr>
                                </xsl:for-each> <!-- Fin de for each de ciclo-->
                            </table>
                        </div>
                        
                        <div class="float_der">
                            <table class="tabla2" border="1">
                                <caption>Direccion</caption>
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Despacho</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><xsl:value-of select="//director/nombre"/></td>
                                        <td><xsl:value-of select="//director/despacho"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="//jefe_estudios/nombre"/></td>
                                        <td><xsl:value-of select="//jefe_estudios/despacho"/></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>    
                    </div>
                </section>

                <div class="contenedor">
                    <section class="section_formulario">
                      <h2>Solicitar informacion sin compromiso</h2>
                    <div class="contenedor_formulario">
                        <form action="procesarPeticion.jsp" method="get">
                          
                        <label for="nombre"></label>
                            <input type="text" id="nombre" name="nombre" placeholder="Nombre"/>
                                  
                        <label for="apellido"></label>
                            <input type="text" id="apellido" name="apellido" placeholder="Apellido"/>
                            
                        <label for="email"></label>
                            <input type="text" id="email" name="email" placeholder="email"/>
                              
                        <label for="tel"></label>
                            <input type="text" pattern="^[9|7|6|\d{8}$" placeholder="Teléfono móvil"/>
                 
                        <label for="como_nos_conoces">¿Que ciclo te interesa?</label>
                            <select name="Ciclos">
                                <option value="DAM"> Desarrollo de aplicaciones multiplataforma - DAM</option>
                                <option value="DAW"> Desarrollo de aplicaciones web - DAW</option>
                                <option value="ASIR"> Administración de Sistemas Informáticos en Red</option>
                            </select>
                        <br/>
              
                        <label for="terminos">¿Acepta nuestros terminos de uso? </label>
                        <br/>
                        <br/>
                            <input type="checkbox" name="terminos" value="Y" /> Si, he leido y acepto los <a href="https://www.edix.com/es/legal/">terminos de uso</a> 
                        <br/>
                        <br/>
                            <input type="submit" value="Enviar"/>
              
                        </form> 
                      </div>
                    </section>
                </div>

                <script type="text/javascript">
                    window.addEventListener("scroll", function(){
                      var header = document.querySelector("header");
                      header.classList.toggle("sticky", window.scrollY >0);
                    })
                </script> 

                <section class="lista">
                    <div>
                        <h3>Información General de Ciclos Formativos</h3>
                        <br/>
                        <xsl:for-each select="ite/ciclos//ciclo">
                        <p>
                            Ciclo:
                            <xsl:value-of select="@id"/>
                            <br/>
                            Nombre grado:
                            <xsl:value-of select="nombre"/>
                            <br/>
                            Grado:
                            <xsl:value-of select="grado"/>
                            <br/>
                            Decreto titulo:
                            <xsl:value-of select="decretoTitulo/@año"/>
                            <br/>
                            <br/>
                          
                        </p>
                        </xsl:for-each>  
                    </div>
                </section>

            </body>

            <footer>
               <br/>
               <img class="logo-footer" src="edix-digital.png"/>
               
                <p style="text-align: center">
                    <xsl:value-of select="ite/empresa"/>
                    <br/>
                    <xsl:value-of select="ite/telefono"/>
                </p>
            </footer>
          
        </html>
    </xsl:template>
</xsl:stylesheet>