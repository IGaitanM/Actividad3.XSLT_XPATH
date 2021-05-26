<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <html>
        <head>
            <title>Instituto Tecnológico Edix</title>
            <link rel="stylesheet" href="estilos_Ite.css"/>?>
        </head>
        <body>
            <main>
            <nav id="menu2">
                <!-- Menú oculto y fijado -->
                <ul>
                    <li><a href="#profesores">PROFESORES</a> </li>
                    <li><a href="#directiva">DIRECTIVA</a> </li>
                    <li><a href="#ciclos">CICLOS</a> </li>
                    <li><a href="#contacto">CONTACTO</a> </li>
                    <li><a href="https://www.edix.com/es/legal/">términos y condiciones</a> </li>
                </ul>
            </nav>

                <header>
                    <div id="head1">
                        <h1><xsl:value-of select="ite/@nombre"/></h1>
                        <h2>
                            <a href="https://institutotecnologico.edix.com"><xsl:value-of select="ite/@web"/></a>
                        </h2>
                    </div>
                    <div id="head2">
                        <h3><xsl:value-of select="ite/empresa"/></h3>
                        <h3>
                            <a href="+34 91 787 39 91"><xsl:value-of select="ite/telefono"/></a>
                        </h3>
                    </div>
                </header>
                <nav id="menu1">
                    <!-- Menú de la página (Requisito de al menos 2 enlaces) -->
                    <ul>
                        <li><a href="#profesores">PROFESORES</a> </li>
                        <li><a href="#directiva">DIRECTIVA</a> </li>
                        <li><a href="#ciclos">CICLOS</a> </li>
                        <li><a href="#contacto">CONTACTO</a> </li>
                        <li><a href="https://www.edix.com/es/legal/">términos y condiciones</a> </li>
                    </ul>
                </nav>

                <section >
                    <!-- Información sobre profesores (Requisito lista ordenada, dentro de una tabla -->

                    <table>
                        
                        <caption><h4>LISTADO DE PROFESORES</h4></caption>
                        <br></br>
                        <ol>
                            <xsl:for-each select="ite/profesores/profesor">
                            <li><xsl:value-of select="nombre"/></li>
                            </xsl:for-each> 
                        </ol>   
                    
                    </table>

                        <!-- Información sobre directiva (Requisito de al menos 2 tablas)-->

                        <table>
                            <p id="directiva"></p>
                            <caption><h4>DIRECTIVA</h4></caption>
                            <tr>
                                <th>CARGO</th>
                                <th>NOMBRE</th>
                                <th>DESPACHO</th>
                            </tr>
                            <xsl:for-each select="ite/director">
                                <tr>
                                    <td>director</td>
                                    <td><xsl:value-of select="nombre"/></td>
                                    <td><xsl:value-of select="despacho"/></td>
                                    <br></br>
                                </tr>
                                </xsl:for-each>
                                <xsl:for-each select="ite/jefe_estudios">
                                <tr>
                                    <td>jefe de estudios</td>
                                    <td><xsl:value-of select="nombre"/></td>
                                    <td><xsl:value-of select="despacho"/></td>
                                    <br></br>
                                </tr>
                            </xsl:for-each>
                        </table>

                    <!-- Información sobre ciclos (Requisito de al menos 2 tablas) -->
 
                        <table>
                            <p id="ciclos"></p>
                            <caption><h4>CICLOS</h4></caption>
                            <xsl:for-each select="ite/ciclos/ciclo">
                                <tr>
                                    <th rowspan="2"><xsl:value-of select="@id"/></th>
                                    <th>Nombre</th>
                                    <th>Grado</th>
                                    <th>Decreto Título</th>
                                    <th>Enlace</th>
                                </tr>
                                <tr>
                                    <td><xsl:value-of select="nombre"/></td>
                                    <td><xsl:value-of select="grado"/></td>
                                    <td><xsl:value-of select="decretoTitulo/@año"/></td>
                                    <td><a href="https://institutotecnologico.edix.com/oferta-academica">Pinche aquí para más información</a></td>
                                </tr>
                                <br></br>
                                </xsl:for-each>
                        </table>

                    <!-- Formulario de contacto (Requisito de al menos 1 formulario) -->

                    <div class="contenedor_formulario">
                        <p id="contacto"></p>
                        <form action="procesarPeticion.jsp" method="get">
                            <h2>¿QUIERES HACERNOS UNA CONSULTA?</h2>
                            <br/>
                            <p>Rellena nuestro formulario y nos pondremos en contacto contigo lo antes posible.</p>
                            <br/>
                            <br/>
    
                            <label for="nombre">Nombre</label>
                                <input type="text" id="nombre" name="nombre" placeholder="Tu nombre..."></input>
                            <label for="apellido">Apellido</label>
                                <input type="text" id="apellidos" name="apellidos" placeholder="Tus apellidos..."></input>
                            <label for="email">Email</label>
                                <input type="text" id="email" name="email" placeholder="Tu email..."></input>
                            <label for="tel">Teléfono</label>
                                <input type="text" pattern="^[9|7|6|\d{8}$" placeholder="Tu numero de contacto..."></input>
    
                        <!--"Menu desplegable" con etiquetas <select><option>. -->    
                            <label for="como_nos_conoces">¿Por que medio, nos has llegado a conocer?: </label>
                            <select name="Medios...">
                                <option value="google"> En el buscador de google</option>
                                <option value="redes sociales"> Por redes sociales</option>
                                <option value="buzoneo"> Publicidad de buzoneo</option>
                                <option value="un conocido"> Por alguien que os conoce</option>
                                <option value="Otro"> Otros medios</option>
                            </select>
                            <br/>
                            <label for="sistemas">¿Sobre que necesitas ampliar la información?: </label>
                            <br/>	
                            <br/>	
                                <input type="checkbox" name="sistemas" value="M" /> Ciclo DAM<br />	
                                <input type="checkbox" name="sistemas" value="W" /> ciclo DAW<br />	
                                <input type="checkbox" name="sistemas" value="A" /> ciclo ASIR<br />
                                <input type="checkbox" name="sistemas" value="T" /> Trabajar con nosotros<br />	
                                <input type="checkbox" name="sistemas" value="O" /> Otros motivos<br />		
                            <br/>
                            <label for="date">¿En que año quieres empezar?</label>
                                <input type="date" name="color"/>
                            <br/>
                            <br/>
                            <label for="asunto">Asunto</label>
                                <textarea id="asunto" name="asunto" placeholder="Escríbenos..." class="textareaclass"></textarea>
                            <label for="terminos">¿Acepta nuestros terminos de uso? </label>
                            <br/>
                            <br/>
                            <input type="checkbox" name="terminos" value="Y" /> Si, he leido y acepto los <a href="https://www.edix.com/es/legal/">terminos de uso</a> 
                            <br/>
                            <br/>
                        <!--boton "submit"-->
                            <input type="submit" value="Enviar"></input>
                        </form>
                    </div>
                </section>

                <footer>
                <br></br>
                <br></br>
                <br></br>
                <br></br>
                <br></br>
                <br></br>
                <br></br>
                <br></br>
                    <p>copyright 2021 Cucudrulu Software. designed by Cucudrulu Web Designs</p>
                </footer>
            </main>
        </body>  
    </html>
 </xsl:template>
</xsl:stylesheet>