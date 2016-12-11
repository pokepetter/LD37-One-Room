import UnityEngine
import System.Collections
import System.Collections.Generic

class ChapterHandler (MonoBehaviour):
        
    public children as List of Transform

    def Awake():
        children = List of Transform()

        for i in range(transform.childCount):
            children.Add(transform.GetChild(i))
            transform.GetChild(i).gameObject.SetActive(false)

        children[0].gameObject.SetActive(true)

    def Update():
        for c in range(children.Count-1):
            if children[c].childCount == 0:
                Destroy(children[c].gameObject)
                children.RemoveAt(0)
                children[0].gameObject.SetActive(true)