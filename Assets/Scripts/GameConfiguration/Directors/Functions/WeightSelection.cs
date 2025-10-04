using UnityEngine;
using UnityEngine.Serialization;

namespace GameConfiguration.Directors.Functions
{
    public class WeightSelection : MonoBehaviour
    {
        private float _totalWeight;
        
        public DirectorCard[] Cards;
    
        public DirectorCard GetChoice(int i) => Cards[i];

        public DirectorCard Evaluate(float normalizedIndex)
        {
            return Cards[EvaluateToChoiceIndex(normalizedIndex)];
        }

        public int EvaluateToChoiceIndex(float normalizedIndex)
        {
            _totalWeight = RecalculateTotalWeight();
            float num1 = normalizedIndex * _totalWeight;
            float num2 = 0.0f;
            while (num1 > num2)
            {
                for (int toChoiceIndex = 0; toChoiceIndex < Cards.Length; ++toChoiceIndex)
                {
                    num2 += Cards[toChoiceIndex].SelectionWeight;
                    if (num1 <= num2) return toChoiceIndex;
                }
            }

            return 404;
        }
        
        private float RecalculateTotalWeight()
        {
            float weight = 0.0f;
            for (int index = 0; index < Cards.Length; ++index)
                weight += Cards[index].SelectionWeight;
            return weight;
        }
    }
}
