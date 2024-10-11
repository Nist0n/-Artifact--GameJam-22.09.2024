using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Shop
{
    public class BuyingSystem : MonoBehaviour
    {
        [SerializeField] private List<GameObject> activeAbilities;
    
        [SerializeField] private List<GameObject> towerList;
    
        [SerializeField] private List<GameObject> passiveAbilities;

        [SerializeField] private List<GameObject> randomActiveAbilities;
        
        [SerializeField] private List<GameObject> randomPassiveAbilities;

        [SerializeField] private List<GameObject> objectsForRandomActiveAbilities;
        
        [SerializeField] private List<GameObject> objectsForRandomPassiveAbilities;

        [SerializeField] private GameObject abilitiesObj;

        private AbilitiesSlots _tower;

        public List<GameObject> GetActiveAbilities() => randomActiveAbilities;

        public List<GameObject> GetPassiveAbilities() => randomPassiveAbilities;

        public void GetTower(AbilitiesSlots tower)
        {
            _tower = tower;
        }

        public void SetRandomActiveAbilities(Button button)
        {
            if (button.transform.GetChild(0).gameObject.transform.childCount == 0)
            {
                if (!_tower.ActivesShowed)
                {
                    RandomGetActiveAbilities();
        
                    for (int i = 0; i < objectsForRandomActiveAbilities.Count; i++)
                    { 
                        Instantiate(randomActiveAbilities[i], objectsForRandomActiveAbilities[i].transform.position, Quaternion.identity,
                            objectsForRandomActiveAbilities[i].transform);
                    }

                    _tower.ActivesShowed = true;
                }
                else
                {
                    SetDetectedActiveAbilities();
                }
            }
        }

        public void SetRandomPassiveAbilities()
        { 
            RandomGetPassiveAbilities();
        
            for (int i = 0; i < objectsForRandomPassiveAbilities.Count; i++)
            {
                Instantiate(randomPassiveAbilities[i], objectsForRandomPassiveAbilities[i].transform.position, Quaternion.identity,
                    objectsForRandomPassiveAbilities[i].transform);
            }
        }

        public void SetDetectedActiveAbilities()
        {
            if (_tower.ActivesShowed)
            {
                for (int i = 0; i < _tower.RandomActiveAbilities.Count; i++)
                { 
                    Instantiate(_tower.RandomActiveAbilities[i], objectsForRandomActiveAbilities[i].transform.position, Quaternion.identity,
                        objectsForRandomActiveAbilities[i].transform);
                }
                Debug.Log("SET Abilities");
            }
        }

        public void ResetActiveLists()
        {
            randomActiveAbilities.Clear();
            foreach (var obj in objectsForRandomActiveAbilities)
            {
                if (obj.transform.childCount != 0)
                {
                    Destroy(obj.transform.GetChild(0).gameObject);
                }
            }
        }

        private void RandomGetActiveAbilities()
        {
            List<GameObject> temp = new List<GameObject>(activeAbilities);

            for (int i = 0; i < 3; i++)
            {
                var rand = Random.Range(0, temp.Count);
            
                randomActiveAbilities.Add(temp[rand]);

                temp.Remove(temp[rand]);
            }

            foreach (var abil in randomActiveAbilities)
            {
                if (_tower.RandomActiveAbilities.Count < 3)
                {
                    _tower.RandomActiveAbilities.Add(abil);
                }
            }
        }
    
        private void RandomGetPassiveAbilities()
        {
            List<GameObject> temp = new List<GameObject>(passiveAbilities);

            for (int i = 0; i < 3; i++)
            {
                var rand = Random.Range(0, temp.Count);
            
                randomPassiveAbilities.Add(temp[rand]);

                temp.Remove(temp[rand]);
            }

            _tower.RandomPassiveAbilities = GetPassiveAbilities();
        }

        public void GetButtonsUpgrade(Button button)
        {
            for (int i = 0; i < button.transform.childCount; i++)
            {
                button.transform.GetChild(i).gameObject.SetActive(!button.transform.GetChild(i).gameObject.activeSelf);
            }
        }

        public void SetAbilityOnTower(Button upgrade)
        {
            var temp = Instantiate(upgrade.gameObject, abilitiesObj.transform);
            _tower.Abilities.Add(temp);
            _tower.CheckForActiveAbility();
        }
    }
}
