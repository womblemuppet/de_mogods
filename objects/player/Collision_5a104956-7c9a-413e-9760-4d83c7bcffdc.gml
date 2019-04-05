if other.hit==false && other.creator!=self.id
{
    losehp(false,"large attack")   
    with other
    {
        hit=true
    }
}

