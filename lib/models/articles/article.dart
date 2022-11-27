import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String id,
    required String title,
    required String content,
    required String outline,
    required String cardImageUrl,
  }) = _Article;

  factory Article.empty() => Article(
        id: '',
        title: 'Test',
        content:
            '# How do solar panels work? \n Our Sun is a natural nuclear reactor. It releases tiny packets of energy called photons, which travel the 93 million miles from the sun to Earth in about 8.5 minutes. \n We all know that solar photovoltaic (PV) panels transform sunlight into useable electricity, but few people know the actual science behind the process. \n ## The Science Behind Solar PV Cells \n Solar PV panels are comprised of many small photovoltaic cells – photovoltaic meaning they can convert sunlight into electricity. These cells are made of semi-conductive materials, most often silicon, a material that can conduct electricity while maintaining the electrical imbalance needed to create an electric field. \n The solar cell is specifically designed with positively and negatively charged semiconductors sandwiched together to create an electric field. \n The n-type silicon is made by including atoms that have one more electron in their outer level than does silicon. It bonds with its silicon neighbor atoms, but one electron is not involved in bonding. Instead, it is free to move inside the silicon structure. \n ![Pn-junction-equilibrium-graphs-984x1024.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/62d91078-b6dc-464f-840e-d1b701187911/Pn-junction-equilibrium-graphs-984x1024.png) \n ![Screen-Shot-2019-03-28-at-5.25.51-PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7a5cac09-4e0b-427d-bf13-cc6a82fd4f6e/Screen-Shot-2019-03-28-at-5.25.51-PM.png) \n A solar cell consists of a layer of p-type silicon placed next to a layer of n-type silicon. In the n-type layer, there is an excess of electrons, and in the p-type layer, there is an excess of positively charged holes. Near the junction of the two layers, the electrons on one side of the junction move into the holes on the other side of the junction. This creates an area around the junction, called the depletion zone, in which the electrons fill the holes. \n When all the holes are filled with electrons in the depletion zone, the p-type side of the depletion zone now contains negatively charged ions, and the n-type side of the depletion zone now contains positively charged ions. The presence of these oppositely charged ions creates an internal electric field that prevents electrons in the n-type layer to fill holes in the p-type layer. \n When sunlight strikes a solar cell, electrons in the silicon are ejected, which results in the formation of “holes”—the vacancies left behind by the escaping electrons. If this happens in the electric field, the field will move electrons to the n-type layer and holes to the p-type layer. If you connect the n-type and p-type layers with a metallic wire, the electrons will travel from the n-type layer to the p-type layer by crossing the depletion zone and then go through the external wire back of the n-type layer, creating a flow of electricity. \n ## Bonus knowledge \n If you apply current/voltage to a p-n junction, the extra energy escapes as light. This is also how LEDs work – just in reverse and you able to create LED.\n',
        outline: 'test' * 10,
        cardImageUrl: '',
      );
}
