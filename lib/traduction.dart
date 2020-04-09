import 'package:attestation/model/settings.dart';

class TRADUCTIONS {
  static final PLACEMENT_DEROGATOIRE_TITLE =
      'ATTESTATION DE DÉPLACEMENT DÉROGATOIRE';
  static final INTRO =
      'En application de l’article 3 du décret du 23 mars 2020 prescrivant les mesures générales nécessaires pour faire face à l’épidémie de Covid19 dans le cadre de l’état d’urgence sanitaire';
  static final SIGN = 'Je soussigné';
  static final CERTIFY =
      'certifie que mon déplacement est lié au motif suivant (cocher la case) autorisé par l’article 3 du décret du 23 mars 2020 prescrivant les mesures générales nécessaires pour faire face à l’épidémie de Covid19 dans le cadre de l’état d’urgence sanitaire (1) :';
  static final APP_TITLE = 'ATTESTATION DE DÉPLACEMENT DÉROGATOIRE';

  static Map<Move, String> MOVE = {
    Move.Pro:
        'Déplacements entre le domicile et le lieu d’exercice de l’activité professionnelle, lorsqu’ils sont indispensables à l’exercice d’activités ne pouvant être organisées sous forme de télétravail ou déplacements professionnels ne pouvant être différés (2).',
    Move.Buy:
        'Déplacements pour effectuer des achats de fournitures nécessaires à l’activité professionnelle et des achats de première nécessité (3) dans des établissements dont les activités demeurent autorisées (liste sur gouvernement.fr).',
    Move.Health:
        'Consultations et soins ne pouvant être assurés à distance et ne pouvant être différés ; consultations et soins des patients atteints d\'une affection de longue durée.',
    Move.Family:
        'Déplacements pour motif familial impérieux, pour l’assistance aux personnes vulnérables ou la garde d’enfants.',
    Move.Activity:
        'Déplacements brefs, dans la limite d\'une heure quotidienne et dans un rayon maximal d\'un kilomètre autour du domicile, liés soit à l\'activité physique individuelle des personnes, à l\'exclusion de toute pratique sportive collective et de toute proximité avec d\'autres personnes, soit à la promenade avec les seules personnes regroupées dans un même domicile, soit aux besoins des animaux de compagnie.',
    Move.Judiciaire: 'Convocation judiciaire ou administrative.',
    Move.InteretGeneral:
        'Participation à des missions d’intérêt général sur demande de l’autorité administrative.'
  };

  static Map<Civility, String> CIVILITY = {
  Civility.Mr: 'Mr',
  Civility.Mme: 'Mme',
  };
}

class QR_TRADUCTIONS {
  static Map<Move, String> MOVE = {
    Move.Pro: 'travail',
    Move.Buy: 'courses',
    Move.Health: 'sante',
    Move.Family: 'famille',
    Move.Activity: 'sport',
    Move.Judiciaire: 'judicaire',
    Move.InteretGeneral: 'missions'
  };
}

