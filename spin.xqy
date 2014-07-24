xquery version "1.0-ml";
declare namespace html = "http://www.w3.org/1999/xhtml";
import module namespace sem = "http://marklogic.com/semantics" 
      at "/MarkLogic/semantics.xqy";
      
import module namespace semi = "http://marklogic.com/semantics/impl" 
      at "/MarkLogic/semantics/sem-impl.xqy";

  declare variable  $spobject := sem:iri("http://spinrdf.org/sp#object");
declare variable  $spvarName := sem:iri ("http://spinrdf.org/sp#varName");
declare variable  $sppredicate := sem:iri ("http://spinrdf.org/sp#predicate");
declare variable  $spsubject := sem:iri ("http://spinrdf.org/sp#subject");
declare variable  $sptemplate := sem:iri ("http://spinrdf.org/sp#template");
declare variable  $spConstruct := sem:iri ("http://spinrdf.org/sp#Construct");
declare variable  $spwhere := sem:iri ("http://spinrdf.org/sp#where");
    
declare variable $ts := json:array () ;


      
declare function local:term ($s as element()) as sem:triple*
{ 
if (!empty($s/Var)) then
   let $b := semi:make-blank()
   let $_ := json:push-array ($ts, sem:triple ($b, $spvarName, text($s/Var)))
   return $b
else if (!empty($s/Const[type="http://www.w3.org/2007/rif#iri"])) then sem:iri(text($s/Const))
else return xdmp:eval ( fn:concat ( sem:curie-shorten(sem:iri($s/@type)), "(", data ($s), ")" ))
};

      
let $rif := <Document xmlns="http://www.w3.org/2007/rif#">
  <payload>
    <Group>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>o</Var>
          </declare>
          <declare>
            <Var>s</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>s</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p</Var>
                    <Var>o</Var>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>s</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>s</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>o</Var>
          </declare>
          <declare>
            <Var>s</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>s</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p</Var>
                    <Var>o</Var>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>p</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>o</Var>
          </declare>
          <declare>
            <Var>s</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>s</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p</Var>
                    <Var>o</Var>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>o</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>o</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>y</Var>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>y</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>x</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>z</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>y</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                        <Var>z</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>z</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>o</Var>
          </declare>
          <declare>
            <Var>s</Var>
          </declare>
          <declare>
            <Var>s2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>s</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                        <Var>s2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>s</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>o</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>s2</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p</Var>
                    <Var>o</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>o</Var>
          </declare>
          <declare>
            <Var>s</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>s</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>o</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>s</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p2</Var>
                    <Var>o</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>o</Var>
          </declare>
          <declare>
            <Var>s</Var>
          </declare>
          <declare>
            <Var>o2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>o</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                        <Var>o2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>s</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>o</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>s</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p</Var>
                    <Var>o2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#differentFrom</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Frame>
          <object>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#label</Const>
          </object>
          <slot ordered="yes">
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#AnnotationProperty</Const>
          </slot>
        </Frame>
      </sentence>
      <sentence>
        <Frame>
          <object>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#comment</Const>
          </object>
          <slot ordered="yes">
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#AnnotationProperty</Const>
          </slot>
        </Frame>
      </sentence>
      <sentence>
        <Frame>
          <object>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#seeAlso</Const>
          </object>
          <slot ordered="yes">
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#AnnotationProperty</Const>
          </slot>
        </Frame>
      </sentence>
      <sentence>
        <Frame>
          <object>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#isDefinedBy</Const>
          </object>
          <slot ordered="yes">
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#AnnotationProperty</Const>
          </slot>
        </Frame>
      </sentence>
      <sentence>
        <Frame>
          <object>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#deprecated</Const>
          </object>
          <slot ordered="yes">
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#AnnotationProperty</Const>
          </slot>
        </Frame>
      </sentence>
      <sentence>
        <Frame>
          <object>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#priorVersion</Const>
          </object>
          <slot ordered="yes">
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#AnnotationProperty</Const>
          </slot>
        </Frame>
      </sentence>
      <sentence>
        <Frame>
          <object>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#backwardCompatibleWith</Const>
          </object>
          <slot ordered="yes">
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#AnnotationProperty</Const>
          </slot>
        </Frame>
      </sentence>
      <sentence>
        <Frame>
          <object>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#incompatibleWith</Const>
          </object>
          <slot ordered="yes">
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#AnnotationProperty</Const>
          </slot>
        </Frame>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>c</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#domain</Const>
                        <Var>c</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Var>c</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>c</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#range</Const>
                        <Var>c</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>y</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Var>c</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>y2</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#FunctionalProperty</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>y1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>y2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>x1</Var>
          </declare>
          <declare>
            <Var>x2</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#InverseFunctionalProperty</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x1</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x2</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>x1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>x2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#IrreflexiveProperty</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>x</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#SymmetricProperty</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>y</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p</Var>
                    <Var>x</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#AsymmetricProperty</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>y</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>x</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>z</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#TransitiveProperty</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>y</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>z</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p</Var>
                    <Var>z</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p1</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p2</Var>
                    <Var>y</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentProperty</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p1</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p2</Var>
                    <Var>y</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentProperty</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p2</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p1</Var>
                    <Var>y</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#propertyDisjointWith</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p1</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p2</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#inverseOf</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p1</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>y</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p2</Var>
                    <Var>x</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#inverseOf</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p2</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>y</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p1</Var>
                    <Var>x</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Frame>
          <object>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Thing</Const>
          </object>
          <slot ordered="yes">
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Class</Const>
          </slot>
        </Frame>
      </sentence>
      <sentence>
        <Frame>
          <object>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Nothing</Const>
          </object>
          <slot ordered="yes">
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
            <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Class</Const>
          </slot>
        </Frame>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Nothing</Const>
                  </slot>
                </Frame>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>v</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#someValuesFrom</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>v</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>v</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>u</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Var>x</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>v</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#someValuesFrom</Const>
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Thing</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>v</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>u</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Var>x</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>v</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#allValuesFrom</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>x</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>v</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>v</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Var>y</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#hasValue</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>x</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>u</Var>
                  </object>
                  <slot ordered="yes">
                    <Var>p</Var>
                    <Var>y</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#hasValue</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>u</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Var>x</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#maxCardinality</Const>
                        <Const type="http://www.w3.org/2001/XMLSchema#integer">0</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>x</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>y2</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#maxCardinality</Const>
                        <Const type="http://www.w3.org/2001/XMLSchema#integer">1</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>x</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>y1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>y2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>c</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#maxQualifiedCardinality</Const>
                        <Const type="http://www.w3.org/2001/XMLSchema#integer">0</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onClass</Const>
                        <Var>c</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>x</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>y</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#maxQualifiedCardinality</Const>
                        <Const type="http://www.w3.org/2001/XMLSchema#integer">0</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onClass</Const>
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Thing</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>x</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>y2</Var>
          </declare>
          <declare>
            <Var>c</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#maxQualifiedCardinality</Const>
                        <Const type="http://www.w3.org/2001/XMLSchema#integer">1</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onClass</Const>
                        <Var>c</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>x</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>y1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>y2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>y1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>y2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>y2</Var>
          </declare>
          <declare>
            <Var>u</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>y1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#maxQualifiedCardinality</Const>
                        <Const type="http://www.w3.org/2001/XMLSchema#integer">1</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onClass</Const>
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Thing</Const>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>x</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>u</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>y2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>y1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sameAs</Const>
                    <Var>y2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c1</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentClass</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c1</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentClass</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>x</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Var>c1</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#disjointWith</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>c</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Class</Const>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Var>c</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>c</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Class</Const>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentClass</Const>
                    <Var>c</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>c</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Class</Const>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Thing</Const>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>c</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Class</Const>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#Nothing</Const>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Var>c</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <declare>
            <Var>c3</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                        <Var>c3</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Var>c3</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>c1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentClass</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>c1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentClass</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c2</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Var>c1</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                        <Var>c1</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentClass</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#ObjectProperty</Const>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                    <Var>p</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#ObjectProperty</Const>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentProperty</Const>
                    <Var>p</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#DatatypeProperty</Const>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                    <Var>p</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#DatatypeProperty</Const>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentProperty</Const>
                    <Var>p</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p3</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                        <Var>p3</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                    <Var>p3</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>p1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentProperty</Const>
                    <Var>p2</Var>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                    <Var>p2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <Frame>
                  <object>
                    <Var>p1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentProperty</Const>
                    <Var>p2</Var>
                  </slot>
                </Frame>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p2</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                    <Var>p1</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                        <Var>p1</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#equivalentProperty</Const>
                    <Var>p2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#domain</Const>
                        <Var>c1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#domain</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#domain</Const>
                        <Var>c</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#domain</Const>
                    <Var>c</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#range</Const>
                        <Var>c1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#range</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#range</Const>
                        <Var>c</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>p1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#range</Const>
                    <Var>c</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <declare>
            <Var>i</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#hasValue</Const>
                        <Var>i</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#hasValue</Const>
                        <Var>i</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>y2</Var>
          </declare>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <declare>
            <Var>y1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#someValuesFrom</Const>
                        <Var>y1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#someValuesFrom</Const>
                        <Var>y2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>y1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                        <Var>y2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#someValuesFrom</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#someValuesFrom</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>y2</Var>
          </declare>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <declare>
            <Var>y1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#allValuesFrom</Const>
                        <Var>y1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#allValuesFrom</Const>
                        <Var>y2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>y1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                        <Var>y2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c1</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Var>c2</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <declare>
            <Var>y</Var>
          </declare>
          <declare>
            <Var>p2</Var>
          </declare>
          <declare>
            <Var>p1</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#allValuesFrom</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#allValuesFrom</Const>
                        <Var>y</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c2</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#onProperty</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>p1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subPropertyOf</Const>
                        <Var>p2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Frame>
                  <object>
                    <Var>c2</Var>
                  </object>
                  <slot ordered="yes">
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2000/01/rdf-schema#subClassOf</Const>
                    <Var>c1</Var>
                  </slot>
                </Frame>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>i1</Var>
          </declare>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>i2</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sourceIndividual</Const>
                        <Var>i1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#assertionProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#targetIndividual</Const>
                        <Var>i2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>i1</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>i2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>x</Var>
          </declare>
          <declare>
            <Var>i</Var>
          </declare>
          <declare>
            <Var>p</Var>
          </declare>
          <declare>
            <Var>lt</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#sourceIndividual</Const>
                        <Var>i</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#assertionProperty</Const>
                        <Var>p</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#targetValue</Const>
                        <Var>lt</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>i</Var>
                      </object>
                      <slot ordered="yes">
                        <Var>p</Var>
                        <Var>lt</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#disjointWith</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
      <sentence>
        <Forall>
          <declare>
            <Var>c1</Var>
          </declare>
          <declare>
            <Var>c2</Var>
          </declare>
          <declare>
            <Var>x</Var>
          </declare>
          <formula>
            <Implies>
              <if>
                <And>
                  <formula>
                    <Frame>
                      <object>
                        <Var>c1</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2002/07/owl#complementOf</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c1</Var>
                      </slot>
                    </Frame>
                  </formula>
                  <formula>
                    <Frame>
                      <object>
                        <Var>x</Var>
                      </object>
                      <slot ordered="yes">
                        <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/1999/02/22-rdf-syntax-ns#type</Const>
                        <Var>c2</Var>
                      </slot>
                    </Frame>
                  </formula>
                </And>
              </if>
              <then>
                <Atom>
                  <op>
                    <Const type="http://www.w3.org/2007/rif#iri">http://www.w3.org/2007/rif#error</Const>
                  </op>
                </Atom>
              </then>
            </Implies>
          </formula>
        </Forall>
      </sentence>
    </Group>
  </payload>
</Document>


return $rif