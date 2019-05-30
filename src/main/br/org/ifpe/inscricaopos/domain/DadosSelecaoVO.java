package main.br.org.ifpe.inscricaopos.domain;

import lombok.Data;

/**
 * @author Roberto Alencar
 *
 */
@Data
public class DadosSelecaoVO {

    private int quantidadeInscritos;
    private int quantidadeDesclassificados;
    private int quantidadeInscritosPosGestao;
    private int quantidadeInscritosPosInovacao;
    
    private int quantitativoClassificadosGestaoVCG; 
    private int quantitativoClassificadosGestaoPPI;
    private int quantitativoClassificadosGestaoPCD;
    
    private int quantitativoClassificadosInovacaoVCG; 
    private int quantitativoClassificadosInovacaoPPI;
    private int quantitativoClassificadosInovacaoPCD;
    
    private double somaNotasGestao;
    private double maiorNotaGestao;
    private double menorNotaGestao;
    private double notaMediaGestao;
    
    private double somaNotasInovacao;
    private double maiorNotaInovacao;
    private double menorNotaInovacao;
    private double notaMediaInovacao;
    
    private int perfilCandidatosGestaoAreaTI; 
    private int perfilCandidatosGestaoAreaOutras;
    private int perfilCandidatosGestaoExpProf;
    private int perfilCandidatosGestaoNaoExpProf;
    private int perfilCandidatosGestaoQtdHomens;
    private int perfilCandidatosGestaoQtdMulheres;
    private int perfilCandidatosGestaoMenor30;
    private int perfilCandidatosGestaoMaior30Menor40;
    private int perfilCandidatosGestaoMaior40Menor50;
    private int perfilCandidatosGestaoMaior50;
    
    private int perfilCandidatosInovaAreaTI; 
    private int perfilCandidatosInovaAreaOutras;
    private int perfilCandidatosInovaExpProf;
    private int perfilCandidatosInovaNaoExpProf;
    private int perfilCandidatosInovaQtdHomens;
    private int perfilCandidatosInovaQtdMulheres;
    private int perfilCandidatosInovaMenor30;
    private int perfilCandidatosInovaMaior30Menor40;
    private int perfilCandidatosInovaMaior40Menor50;
    private int perfilCandidatosInovaMaior50;
    
}
