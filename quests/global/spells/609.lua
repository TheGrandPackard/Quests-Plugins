-- Succor: Ro
function event_spell_effect(e)
  --local mob = eq.get_entity_list():GetClientByID(e.caster_id):CastToMob();
  --local client = eq.get_entity_list():GetClientByID(e.caster_id):CastToClient();
  local group = eq.get_entity_list():GetClientByID(e.caster_id):GetGroup();
  local client;
  local count;

  if ( group.valid ) then
    count = group:GroupCount();
    for i = 0, count - 1, 1 do
      client = group:GetMember(i):CastToClient();
      client:MovePC(35, 304, -2000, -25, 120);
    end
  else
    client = eq.get_entity_list():GetClientByID(e.caster_id):CastToClient();
    client:MovePC(35, 304, -2000, -25, 120);
  end

  return 1;
end
