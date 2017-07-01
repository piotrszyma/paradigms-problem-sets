-module(z2).

-export([left_rotation/1]).

left_rotation({node, ParentKey, ParentValue, ParentLeft, {node, ChildKey, ChildValue, ChildLeft, ChildRight}}) ->
	{node, ChildKey, ChildValue, {node, ParentKey, ParentValue, ParentLeft, ChildLeft}, ChildRight};
left_rotation(_) ->
	error.
	
right_rotation({node, ParentKey, ParentValue, {node, ChildKey, ChildValue, ChildLeft, ChildRight}, ParentRight}) ->
	{node, ChildKey, ChildValue, ChildLeft, {node, ParentKey, ParentValue, ParentLeft, ParentRight}};
right_rotation(_) ->
	error.