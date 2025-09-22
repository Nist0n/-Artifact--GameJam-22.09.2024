using UnityEngine;

namespace GameConfiguration.Directors.Functions
{
    public class WeightSelection : MonoBehaviour
    {
        public DirectorCard[] cards;

        private float _totalWeight;
    
        public DirectorCard GetChoice(int i) => cards[i];

        public DirectorCard Evaluate(float normalizedIndex)
        {
            return cards[EvaluateToChoiceIndex(normalizedIndex)];
        }

        public int EvaluateToChoiceIndex(float normalizedIndex)
        {
            _totalWeight = RecalculateTotalWeight();
            float num1 = normalizedIndex * _totalWeight;
            float num2 = 0.0f;
            while (num1 > num2)
            {
                for (int toChoiceIndex = 0; toChoiceIndex < cards.Length; ++toChoiceIndex)
                {
                    num2 += cards[toChoiceIndex].SelectionWeight;
                    if (num1 <= num2) return toChoiceIndex;
                }
            }

            return 404;
        }
        
        private float RecalculateTotalWeight()
        {
            float weight = 0.0f;
            for (int index = 0; index < cards.Length; ++index)
                weight += cards[index].SelectionWeight;
            return weight;
        }
    }
}
