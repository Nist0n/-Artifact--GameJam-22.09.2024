using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BuyingSystem : MonoBehaviour
{
    [SerializeField] private List<GameObject> activeAbilities;
    
    [SerializeField] private List<GameObject> towerList;
    
    [SerializeField] private List<GameObject> passiveAbilities;

    [SerializeField] private List<GameObject> randomAbilities;

    [SerializeField] private List<GameObject> objectsForRandomAbilities;

    [SerializeField] private GameObject abilitiesObj;

    private int _index;

    public void GetTowerIndex(int index)
    {
        _index = index;
    }

    public void SetRandomActiveAbilities()
    {
        RandomGetActiveAbilities();
        
        for (int i = 0; i < objectsForRandomAbilities.Count; i++)
        { 
            Instantiate(randomAbilities[i], objectsForRandomAbilities[i].transform.position, Quaternion.identity,
                    objectsForRandomAbilities[i].transform);
        }
    }
    
    public void SetRandomPassiveAbilities()
    { 
        RandomGetPassiveAbilities();
        
        for (int i = 0; i < objectsForRandomAbilities.Count; i++)
        {
            Instantiate(randomAbilities[i], objectsForRandomAbilities[i].transform.position, Quaternion.identity,
                objectsForRandomAbilities[i].transform);
        }
    }

    public void ResetLists()
    {
        objectsForRandomAbilities.Clear();
        randomAbilities.Clear();
    }
    

    private void RandomGetActiveAbilities()
    {
        List<GameObject> temp = new List<GameObject>(activeAbilities);

        for (int i = 0; i < 3; i++)
        {
            var rand = Random.Range(0, temp.Count);
            
            randomAbilities.Add(temp[rand]);

            temp.Remove(temp[rand]);
        }

    }
    
    private void RandomGetPassiveAbilities()
    {
        List<GameObject> temp = passiveAbilities;

        for (int i = 0; i < 3; i++)
        {
            var rand = Random.Range(0, temp.Count);
            
            randomAbilities.Add(temp[rand]);

            temp.Remove(temp[rand]);
        }
    }

    public void GetButtonsUpgrade(Button button)
    {
        for (int i = 0; i < button.transform.childCount; i++)
        {
            objectsForRandomAbilities.Add(button.transform.GetChild(i).gameObject);
        }
    }

    public void SetAbilityOnTower(Button upgrade)
    {
        var temp = Instantiate(upgrade.gameObject, abilitiesObj.transform);
        towerList[_index].GetComponent<AbilitiesSlots>().Abilities.Add(temp);
        towerList[_index].GetComponent<AbilitiesSlots>().CheckForActiveAbility();
    }
}
